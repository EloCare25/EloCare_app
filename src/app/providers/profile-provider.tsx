"use client";

import { createContext, useContext, useState, useEffect, ReactNode } from "react";
import { setProfile as setProfileAction } from "@/app/actions/profile";
import { DEFAULT_PROFILE, type ProfileType } from "@/app/types/profile";

interface ProfileContextType {
  profile: ProfileType;
  setProfile: (profile: ProfileType) => Promise<void>;
  isLoading: boolean;
}

const ProfileContext = createContext<ProfileContextType | undefined>(undefined);

export function ProfileProvider({
  children,
  initialProfile
}: {
  children: ReactNode;
  initialProfile: ProfileType;
}) {
  const [profile, setProfileState] = useState<ProfileType>(initialProfile);
  const [isLoading, setIsLoading] = useState(false);

  const setProfile = async (newProfile: ProfileType) => {
    setIsLoading(true);
    try {
      await setProfileAction(newProfile);
      setProfileState(newProfile);
      window.location.href = "/";
    } catch (error) {
      console.error("Failed to set profile:", error);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <ProfileContext.Provider value={{ profile, setProfile, isLoading }}>
      {children}
    </ProfileContext.Provider>
  );
}

export function useProfile() {
  const context = useContext(ProfileContext);
  if (context === undefined) {
    throw new Error("useProfile must be used within a ProfileProvider");
  }
  return context;
}
