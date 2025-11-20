import type { ProfileType } from "@/app/types/profile";

type Route = {
  id: string;
  pathname: string;
  title: string;
  enabled: boolean;
  icon?: string;
  profiles: ProfileType[];
};

export const routes: Route[] = [
  {
    id: "clinicas",
    pathname: "/clinicas",
    title: "Clínicas",
    enabled: true,
    profiles: ["user"]
  },
  {
    id: "transporte",
    pathname: "/transporte",
    title: "Transporte",
    enabled: true,
    profiles: ["user"]
  },
  {
    id: "equipamentos",
    pathname: "/equipamentos",
    title: "Equipamentos",
    enabled: true,
    profiles: ["professional"]
  },
  {
    id: "telemedicina",
    pathname: "/telemedicina",
    title: "Telemedicina",
    enabled: true,
    profiles: ["professional"]
  }
]

export function getRoutesForProfile(profile: ProfileType): Route[] {
  return routes.filter(route => route.profiles.includes(profile));
}
