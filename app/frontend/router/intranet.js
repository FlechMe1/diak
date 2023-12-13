import {createRouter, createWebHistory} from 'vue-router'
import EventsIndex from '../components/Events/Index.vue'
import IntranetUsersIndex from "@/pages/Intranet/Users/Index.vue";
import ChurchesIndex from "../components/Churches/Index.vue";
import CampaignsIndex from "../components/Campaigns/Index.vue";
import PostsIndex from "../components/Posts/Index.vue";
import SessionIndex from "../components/Session/Index.vue";

export default createRouter({
    history: createWebHistory(),
    routes:  [
        {
            path:     '/',
            redirect: {name: 'users'},
        },
        {
            path:      '/connexion',
            component: SessionIndex,
            name:      'connexion',
        },
        {
            path:      '/users',
            component: IntranetUsersIndex,
            name:      'users',
        },
        {
            path:      '/churches',
            component: ChurchesIndex,
            name:      'churches',
        },
        {
            path:      '/events',
            component: EventsIndex,
            name:      'events',
        },
        {
            path:      '/campaigns',
            component: CampaignsIndex,
            name:      'campaigns',
        },
        {
            path:      '/posts',
            component: PostsIndex,
            name:      'posts',
        },
    ],
})
