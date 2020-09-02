import { check } from 'k6';
import http from 'k6/http';

export let options = {
    vus : 50,
    duration: '10s'
}

export default function(){
    let res = http.get('https://procesor2017.github.io/gitHubWorkShop/');
    check(res,{'is status 200': (r) => r.status === 200});
}