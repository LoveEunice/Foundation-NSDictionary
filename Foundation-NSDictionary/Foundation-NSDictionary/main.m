//
//  main.m
//  Foundation-NSDictionary
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //不可变字典：无序的对象集合 可以存放，NSNull
        //创建字典  键值对，一定要保持成对出现
        NSDictionary *dic1=[[NSDictionary alloc] initWithObjectsAndKeys:@"xiaoming",@"name",@"23",@"age",@"男",@"sex",[NSNull null],@"girlfriend", nil];
        NSLog(@"dic1==%@",dic1);
        NSDictionary *dic2=[[NSDictionary alloc] initWithObjects:@[@"火锅英雄",@"斗破苍穹",@"演员"] forKeys:@[@"movie",@"book",@"music"]];
        NSLog(@"dic2=%@",dic2);
        //dic2[@"book"]=@"iOS开发";
        //类方法
        NSDictionary *dic3=[NSDictionary dictionaryWithDictionary:dic2];
        //查看字典元素个数(键值对的个数)
        NSLog(@"dic1=%ld,dic3=%ld",dic1.count,[dic3 count]);
        //不可变字典的快捷方式 @{key:object,...}
        NSDictionary *dic4=@{@"date":@"2016/4/5",@"time":@"10:53",@"week":@"周二"};
        NSLog(@"dic4=%@",dic4);
        //访问字典
        NSLog(@"%@",[dic4 objectForKey:@"date"]);
        //快捷方式
        NSLog(@"%@",dic4[@"time"]);
        //遍历
        NSLog(@"枚举器遍历");//因为无序，所以没有反向枚举
        NSEnumerator *eno=[dic4 objectEnumerator];
        id obj;
        while (obj=[eno nextObject])
        {
            NSLog(@"%@",obj);
        }
        NSLog(@"快速枚举");  //常用
        for (id key in dic3)
        {
            NSLog(@"%@=%@",key,dic3[key]);
        }
        //查看字典所有关键字
        NSArray *keys=[dic3 allKeys];
        //查看字典所有值
        NSArray *values=[dic3 allValues];
        NSLog(@"keys:%@",keys);
        NSLog(@"values:%@",values);
        
        //可变字典 NSMutableDictionary
        NSMutableDictionary *mulDic1=[NSMutableDictionary dictionaryWithCapacity:10];
        //追加
        [mulDic1 setObject:@"xiaoli" forKey:@"name"];
        [mulDic1 setValue:@"21" forKey:@"age"];
        NSLog(@"mulDic1=%@",mulDic1);
        //替换
        mulDic1[@"name"]=@"xiaoqing";
        NSLog(@"mulDic=%@",mulDic1);
        NSMutableDictionary *mulDic2=[NSMutableDictionary dictionaryWithDictionary:dic1];
        NSLog(@"mulDic2=%@",mulDic2);
        //删除 指定关键字的键值对(有则删除)
        [mulDic2 removeObjectForKey:@"name"];
        NSLog(@"mulDic2=%@",mulDic2); 
        //批量删除
        [mulDic2 removeObjectsForKeys:@[@"age",@"sex"]];
        NSLog(@"mulDic2=%@",mulDic2);
        //全部删除
        [mulDic2 removeAllObjects];
        NSLog(@"mulDic2=%@,%p",mulDic2,mulDic2);
        //重新赋值
        [mulDic2 setDictionary:dic1];
        NSLog(@"mulDic2=%@",mulDic2);
        
    }
    return 0;
}
