/**
 * Created by xiaom on 2016/10/19.
 */

const baseUrl = "/dmt/server/index.php?g=api&";

//提交报修
const API_SAVE =baseUrl + 'm=orders&a=save';

//获取区域
const API_GET_BUILDING =baseUrl + 'm=building&a=getBuilding';

//获取故障设备
const API_GET_DEVICE =baseUrl + 'm=device&a=getDevice';

//获取校区
const API_GET_CAMPUS =baseUrl + 'm=building&a=getCampus';

const API_GET_SEARCH =baseUrl + 'm=orders&a=search';

const API_GET_DETAILS =baseUrl + 'm=orders&a=details&id=';

module.exports = {
  API_SAVE: API_SAVE,
  API_GET_BUILDING: API_GET_BUILDING,
  API_GET_DEVICE: API_GET_DEVICE,
  API_GET_CAMPUS: API_GET_CAMPUS,
  API_GET_SEARCH: API_GET_SEARCH,
  API_GET_DETAILS: API_GET_DETAILS,
};
