#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

static int __init my_init(void) {
    printk(KERN_INFO "My Feature is enabled\n");
    return 0;
}

static void __exit my_exit(void) {
    printk(KERN_INFO "My Feature is disabled\n");
}

module_init(my_init);
module_exit(my_exit);

