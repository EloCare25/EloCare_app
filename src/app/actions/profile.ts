"use server";

import { cookies } from "next/headers";
import { PROFILE_COOKIE_NAME, DEFAULT_PROFILE, type ProfileType } from "@/app/types/profile";

export async function getProfile(): Promise<ProfileType> {
  const cookieStore = await cookies();
  const profile = cookieStore.get(PROFILE_COOKIE_NAME)?.value as ProfileType | undefined;
  return profile || DEFAULT_PROFILE;
}

export async function setProfile(profile: ProfileType): Promise<void> {
  const cookieStore = await cookies();
  cookieStore.set(PROFILE_COOKIE_NAME, profile, {
    path: "/",
    maxAge: 60 * 60 * 24 * 365, // 1 year
    sameSite: "lax",
  });
}
