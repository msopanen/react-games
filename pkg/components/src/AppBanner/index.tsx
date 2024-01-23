import { FC } from "react";

export interface AppBannerProps {
  appName: string;
}

const AppBanner: FC<AppBannerProps> = ({ appName }) => {
  return <div>This is app {appName} banner</div>;
};

export default AppBanner;
