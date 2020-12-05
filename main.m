#include <stdio.h>

int main(int argc, char *argv[], char *envp[]) {
	@autoreleasepool {
		printf("Hello world!\n");
        NSString *str = @"Benny的log！";
        NSLog(@"%@",str);
        [str writeToFile:@"/tmp/mylog.log" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        //保持运行
        CFRunLoopRun();
		return 0;
	}
}
