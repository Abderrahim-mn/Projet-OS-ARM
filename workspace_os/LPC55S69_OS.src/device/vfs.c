#include <stdlib.h>
#include <string.h>
#include "vfs.h"
//#include <fat.h>

/***************************************************************************
 * File name manipulation utilities
 ***************************************************************************/
// strdup
//   duplicates a string (warning: allocates memory!)
char* strdup(const char *str)
{
	size_t siz;
	char *copy;

	siz = strlen(str) + 1;
	if ((copy = os_alloc(siz)) == NULL)
		return NULL;
	memcpy(copy, str, siz);
	return copy;
}

// -------------------- dirname ------------------------------------------
// returns parent's name (everything before the last '/')
char * dirname(char *path)
{
	char *dname=strdup(path);
	char *slash=NULL;
	char *p=dname;

	while(*p){
		if(*p=='/') slash=p;
		p++;
	}
  
	if(slash) *slash=0;
	if(*dname==0) strcpy(dname, "/");
	return dname;
}
  
// -------------------- basename ------------------------------------------
// returns the filename (everything after the last '/')
char * basename(char *path)
{
	char *p=path;
	char *slash=NULL;
	while(*p){
		if(*p=='/') slash=p;
		p++;
	}
	if(slash) return slash+1;
	else return path;
}

/***************************************************************************
 * Opened file descriptor array with Device associated to file descriptor
 ***************************************************************************/
FileObject * opened_fds[MAX_OPENED_FDS];

/***************************************************************************
 * Registered device table
 ***************************************************************************/
extern Device* device_table[];

/* dev_lookup
 *   search for a device represented by its name in the device table
 */
static Device *dev_lookup(char *path)
{
	char * dir = dirname(path);
	
	if (!strcmp(dir,"/dev")) {
		free(dir);
	    int i=0;
	    char *devname = basename(path);
	    
    	Device *dev=device_table[0];
    	while (dev) {
        	if (!strcmp(devname,dev->name))
            	return dev;
        	dev=device_table[++i];
    	}
    } else os_free(dir);
    return NULL;
}

#ifdef _FAT_H_
/***************************************************************************
 * FAT Object
 ***************************************************************************/
extern Device dev_fs;
static FatFS *fs=NULL;

int mount()
{
	return dev_fs.init(&dev_fs);
	return 0;
}
#endif
/***************************************************************************
 * Generic device functions
 ***************************************************************************/
Semaphore *vfs_mutex;

/* open
 *   returns a file descriptor for path name
 */
int open(char *path, int flags)
{
	/* A COMPLETER */
	char dev[] = "/dev";
		int devSize = sizeof(dev);

		for(int i=0; i < MAX_OPENED_FDS; i++)
		{
			FileObject** f = &(opened_fds[i]);
			if(!*f)
			{
				*f = malloc((int)sizeof(FileObject));//create file object
				(*f)->name = path;//set path
				(*f)->offset = 0;
				if(memcmp(path,dev,devSize))//if dev dir
				{
					(*f)->flags = flags |F_IS_DEVDIR; //add dev dir flag

					(*f)->dev = dev_lookup(path);
					(*f)->flags = flags;
					if(!(*f)->dev->open(*f))//if device can't be opened
					{
						free(*f);
						return -1;
					}
				}

				return i;
			}
		}
		return -1;
}

/* close
 *   close the file descriptor
 */
int close(int fd)
{
	/* A COMPLETER */
	opened_fds[fd]->dev->close(opened_fds[fd]);
	free(opened_fds[fd]);
	opened_fds[fd] = NULL;

    return -1;
}

/* read
 *   read len bytes from fd to buf, returns actually read bytes
 */
int read(int fd, void *buf, size_t len)
{
	/* A COMPLETER */
	return opened_fds[fd]->dev->read(opened_fds[fd],buf,len);
}

/* write
 *   write len bytes from buf to fd, returns actually written bytes
 */
int write(int fd, void *buf, size_t len)
{
	/* A COMPLETER */
	return opened_fds[fd]->dev->write(opened_fds[fd],buf,len);
}

/* ioctl
 *   set/get parameter for fd
 */
int ioctl(int fd, int op, void** data)
{
	/* A COMPLETER */
	return opened_fds[fd]->dev->ioctl(opened_fds[fd],op,data);
}

/* lseek
 *   set the offset in fd
 */
int lseek(int fd, unsigned int offset)
{
	/* A COMPLETER */
	opened_fds[fd]->offset = offset;
	return offset;
}

#ifdef _FAT_H_
/***************************************************************************
 * Directory handling functions
 ***************************************************************************/
int dev_fs_next_dir(DIR *dir);

int readdir(int fd, DIR **dir)
{
	FileObject *f=opened_fds[fd];
	
	if (f) {
		if (f->flags & F_IS_ROOTDIR) {
			f->flags &=~F_IS_ROOTDIR;
			strcpy(f->dir->entry, "dev");
			f->dir->entry_isdir=1;
			f->dir->entry_size=0;
			*dir=f->dir;
			return 0;
		} else if (f->flags & F_IS_DEVDIR) {
			if (device_table[f->offset]) {
				strcpy(f->dir->entry, device_table[f->offset]->name);
				f->dir->entry_isdir=0;
				f->dir->entry_size=0;
				*dir=f->dir;
				f->offset++;
				return 0;
			}
		} else if ((f->flags & F_IS_DIR) && dev_fs_next_dir(f->dir)) {
			*dir=f->dir;
			return 0;
		}
	}
	return -1;
}
#endif
