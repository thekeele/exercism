export const gigasecond = (time) => {
  return new Date(time.setSeconds(time.getSeconds() + Math.pow(10, 9)));
};
