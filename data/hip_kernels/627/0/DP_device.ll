; ModuleID = '../data/hip_kernels/627/0/main.cu'
source_filename = "../data/hip_kernels/627/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@gcT_size = protected addrspace(4) externally_initialized global i32 0, align 4
@gcP_size = protected local_unnamed_addr addrspace(4) externally_initialized global i32 0, align 4
@gcThre = protected addrspace(4) externally_initialized global i32 0, align 4
@gcP_seq = protected addrspace(4) externally_initialized global [1024 x i8] zeroinitializer, align 16
@gcMatch = protected addrspace(4) externally_initialized global i32 0, align 4
@gcMiss = protected addrspace(4) externally_initialized global i32 0, align 4
@gcExtend = protected addrspace(4) externally_initialized global i32 0, align 4
@gcBegin = protected addrspace(4) externally_initialized global i32 0, align 4
@_ZZ2DPPcS_PiE4Hp_1 = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16
@_ZZ2DPPcS_PiE4Ep_1 = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [7 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @gcBegin to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @gcExtend to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @gcMatch to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @gcMiss to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([1024 x i8], [1024 x i8] addrspace(4)* @gcP_seq, i32 0, i32 0) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @gcT_size to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @gcThre to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z2DPPcS_Pi(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds [1024 x i8], [1024 x i8] addrspace(4)* @gcP_seq, i64 0, i64 %5
  %7 = load i8, i8 addrspace(4)* %6, align 1, !tbaa !5
  %8 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ2DPPcS_PiE4Hp_1, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %8, align 4, !tbaa !8
  %9 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ2DPPcS_PiE4Ep_1, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %9, align 4, !tbaa !8
  %10 = load i32, i32 addrspace(4)* @gcT_size, align 4, !tbaa !8
  %11 = sub nsw i32 0, %4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %25

13:                                               ; preds = %3
  %14 = mul nsw i32 %10, %4
  %15 = sub nsw i32 %14, %4
  %16 = load i32, i32 addrspace(4)* @gcMiss, align 4
  %17 = load i32, i32 addrspace(4)* @gcMatch, align 4
  %18 = load i32, i32 addrspace(4)* @gcBegin, align 4, !tbaa !8
  %19 = load i32, i32 addrspace(4)* @gcExtend, align 4, !tbaa !8
  %20 = add nuw nsw i32 %4, 1
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ2DPPcS_PiE4Hp_1, i32 0, i32 %20
  %22 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ2DPPcS_PiE4Ep_1, i32 0, i32 %20
  %23 = load i32, i32 addrspace(4)* @gcThre, align 4, !tbaa !8
  %24 = shl nuw nsw i32 %4, 16
  br label %26

25:                                               ; preds = %80, %3
  ret void

26:                                               ; preds = %13, %80
  %27 = phi i32 [ %11, %13 ], [ %82, %80 ]
  %28 = phi i32 [ %15, %13 ], [ %81, %80 ]
  %29 = phi i32 [ 0, %13 ], [ %41, %80 ]
  %30 = phi i32 [ 0, %13 ], [ %45, %80 ]
  %31 = phi i32 [ 0, %13 ], [ %67, %80 ]
  %32 = phi i32 [ 0, %13 ], [ %66, %80 ]
  %33 = icmp slt i32 %27, 0
  br i1 %33, label %40, label %34

34:                                               ; preds = %26
  %35 = zext i32 %27 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !5
  %38 = icmp eq i8 %37, %7
  %39 = select i1 %38, i32 %17, i32 %16
  br label %40

40:                                               ; preds = %34, %26
  %41 = phi i32 [ %29, %26 ], [ %39, %34 ]
  %42 = add nsw i32 %41, %30
  %43 = add nsw i32 %18, %32
  %44 = add nsw i32 %19, %31
  %45 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !8
  %46 = add nsw i32 %45, %18
  %47 = load i32, i32 addrspace(3)* %9, align 4, !tbaa !8
  %48 = add nsw i32 %47, %19
  %49 = tail call i32 @llvm.smax.i32(i32 %43, i32 %44)
  %50 = icmp sgt i32 %46, %49
  %51 = select i1 %50, i32 %46, i32 %48
  %52 = icmp sgt i32 %42, %51
  %53 = sext i32 %28 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  %55 = tail call i32 @llvm.smax.i32(i32 %42, i32 %51)
  %56 = select i1 %52, i8 1, i8 2
  %57 = icmp sgt i32 %55, %49
  %58 = select i1 %57, i8 %56, i8 3
  %59 = tail call i32 @llvm.smax.i32(i32 %55, i32 %49)
  store i8 %58, i8 addrspace(1)* %54, align 1, !tbaa !5
  %60 = icmp slt i32 %59, 1
  br i1 %60, label %61, label %64

61:                                               ; preds = %40
  %62 = sext i32 %28 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %62
  store i8 0, i8 addrspace(1)* %63, align 1, !tbaa !5
  br label %64

64:                                               ; preds = %61, %40
  %65 = phi i32 [ 0, %61 ], [ %51, %40 ]
  %66 = phi i32 [ 0, %61 ], [ %59, %40 ]
  %67 = phi i32 [ 0, %61 ], [ %49, %40 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = icmp sgt i32 %27, -1
  br i1 %68, label %69, label %70

69:                                               ; preds = %64
  store i32 %66, i32 addrspace(3)* %21, align 4, !tbaa !8
  store i32 %65, i32 addrspace(3)* %22, align 4, !tbaa !8
  br label %70

70:                                               ; preds = %69, %64
  %71 = icmp slt i32 %66, %23
  br i1 %71, label %80, label %72

72:                                               ; preds = %70
  %73 = sext i32 %27 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !8
  %76 = and i32 %75, 65535
  %77 = icmp ult i32 %66, %76
  br i1 %77, label %80, label %78

78:                                               ; preds = %72
  %79 = add nsw i32 %66, %24
  store i32 %79, i32 addrspace(1)* %74, align 4, !tbaa !8
  br label %80

80:                                               ; preds = %72, %78, %70
  %81 = add nsw i32 %28, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = add nsw i32 %27, 1
  %83 = icmp eq i32 %82, %10
  br i1 %83, label %25, label %26, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
