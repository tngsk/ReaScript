-- for Debug
reaper.ClearConsole()
function Console(mes)
    reaper.ShowConsoleMsg(tostring(mes..'\n'))
end

-- Active Project
proj = 0

-- Insert Track
idx = 0
reaper.InsertTrackAtIndex(idx, true)

-- Count Tracks
track_count = reaper.CountTracks(proj)
-- Console(track_count)

selected_track_count = reaper.CountSelectedTracks(proj)
-- Console(selected_track_count)

-- Get Tracks

track_count = reaper.CountTracks(proj)
for i = 0, track_count-1 do
    local track = reaper.GetTrack(proj, i)
    local retval, track_name = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)
    local vol = reaper.GetMediaTrackInfo_Value(track, 'D_VOL ')
    Console(track_name..vol)
end

-- Delete Track

last_track = reaper.GetTrack(proj, track_count-1)
reaper.DeleteTrack(last_track)
