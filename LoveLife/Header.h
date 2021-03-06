//
//  Header.h
//  LoveLife
//
//  Created by 杨阳 on 15/12/29.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#ifndef Header_h
#define Header_h

//全局的头文件
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "FactoryUI.h"
#import "UMSocial.h"

//全局的宏定义
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height - 64)
#define RGB(r,g,b,a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

#define APPKEY @"566cf4ebe0f55a23e5007be9"


//接口
//数据接口
//首页
#define HOMEURL @"http://open4.bantangapp.com/recommend/index?client_id=bt_app_android&client_secret=ffcda7a1c4ff338e05c42e7972ba7b8d&page=%d&pagesize=10"
//首页详情
#define HOMEDETAIL @"http://open4.bantangapp.com/topic/info?client_id=bt_app_android&client_secret=ffcda7a1c4ff338e05c42e7972ba7b8d&id=%zd"
//阅读
//美文
#define ARTICALURL @"http://d.yixincao.com/interface/getdata.php?act=list&type=nuanwen&page=%d"
//美文详情
#define ARTICALDETAILURL @"http://d.yixincao.com/detailshow.php?id=%@&from=ios"
//语录
#define UTTERANCEURL @"http://api.10x.cn/d0c0ebbacc664252b1349e4d9562f6eb/367/tab1/%zd.txt"

//美食
#define FOODURL @"http://api.izhangchu.com:/"


//音乐
#define liuxing @"http://theinfoapps.com/myfm/category/1003841/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=541105&e=6RVcc6soACRbdXxqjkatPg"
#define xinge @"http://theinfoapps.com/myfm/category/61/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=330044&e=ps_YSM9m_r-HkZIGujuUFg"

#define huayu @"http://theinfoapps.com/myfm/category/10001/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=035453&e=f9kps3LBJyEC7GQT63x6dg"

#define yingyu @"http://theinfoapps.com/myfm/category/10004/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=143121&e=XGP8qT2gcYL9smqtVBG1hA"

#define riyu @"http://theinfoapps.com/myfm/category/10006/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=401453&e=BxF7Xk4PgsnwbiDkcwye2A"

#define qingyinyue @"http://theinfoapps.com/myfm/category/9/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=001512&e=0vCiDwfc1wJcu9u-BKoEKA"

#define minyao @"http://theinfoapps.com/myfm/category/8/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=350515&e=W3uIfTpXmGckEbvYwBP_rA"

#define hanyu @"http://theinfoapps.com/myfm/category/1002500/?appid=com.infoapps.myfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206&r=524525&e=x-OCW3kqtDe2UEUnxVqCtg"

#define paihangbang @"http://theinfoapps.com/myfm/rank/v2/?appid=com.infoapps.japanfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%252520OS&osv=8.1.3&carrier=%2525E4%2525B8%2525AD%2525E5%25259B%2525BD%2525E7%2525A7%2525BB%2525E5%25258A%2525A8&device_type=iPhone%25206&r=150355&e=qxCeQmVva4FDQcUMsjEy7g&appid=com.infoapps.japanfm&appname=JapanFM&v=2.5.1&lang=zh-Hans&jb=0&deviceid=74496205-8F51-4552-9DCA-4130F80C2112&phonetype=iphone&model=iphone5,2&osn=iPhone%2520OS&osv=8.1.3&carrier=%25E4%25B8%25AD%25E5%259B%25BD%25E7%25A7%25BB%25E5%258A%25A8&device_type=iPhone%206"

#endif /* Header_h */
