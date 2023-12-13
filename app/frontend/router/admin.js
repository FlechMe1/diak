import {createRouter, createWebHistory} from 'vue-router'
import HomePage from '../components/Pages/Home.vue'
import UsersIndex from '../components/Users/Index.vue'
import ChurchesIndex from '../components/Churches/Index.vue'
import AssociationsIndex from '../components/Associations/Index.vue'
import CampaignsIndex from '../components/Campaigns/Index.vue'
import EventsIndex from "../components/Events/Index.vue";
import PostsIndex from "../components/Posts/Index.vue";
import RolesIndex from "../components/Roles/Index.vue";
import SessionIndex from "../components/Session/Index.vue";

export default createRouter({
    history: createWebHistory(),
    routes:  [
        {
            path:      '/',
            component: HomePage,
            name:      'home',
        },
        {
            path:      '/connexion',
            component: SessionIndex,
            name:      'connexion',
        },
        {
            path:      '/users',
            component: UsersIndex,
            name:      'users',
        },
        {
            path:      '/churches',
            component: ChurchesIndex,
            name:      'churches',
        },
        {
            path:      '/associations',
            component: AssociationsIndex,
            name:      'associations',
        },
        {
            path:      '/campaigns',
            component: CampaignsIndex,
            name:      'campaigns',
        },
        {
            path:      '/events',
            component: EventsIndex,
            name:      'events',
        },
        {
            path:      '/posts',
            component: PostsIndex,
            name:      'posts',
        },
        {
            path:      '/roles',
            component: RolesIndex,
            name:      'roles',
        }
    ],
})
