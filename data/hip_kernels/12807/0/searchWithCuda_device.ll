; ModuleID = '../data/hip_kernels/12807/0/main.cu'
source_filename = "../data/hip_kernels/12807/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14searchWithCudaPdPcS0_S_PiS1_S1_S1_S1_(double addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = sext i32 %10 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %12
  %14 = bitcast i32 addrspace(1)* %13 to <2 x i32> addrspace(1)*
  %15 = load <2 x i32>, <2 x i32> addrspace(1)* %14, align 4, !tbaa !4
  %16 = extractelement <2 x i32> %15, i64 0
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  %19 = extractelement <2 x i32> %15, i64 1
  %20 = sub nsw i32 %19, %16
  %21 = sext i32 %11 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %21
  %23 = bitcast i32 addrspace(1)* %22 to <2 x i32> addrspace(1)*
  %24 = load <2 x i32>, <2 x i32> addrspace(1)* %23, align 4, !tbaa !4
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %26
  %28 = extractelement <2 x i32> %24, i64 1
  %29 = sub nsw i32 %28, %25
  %30 = icmp eq i32 %20, %29
  br i1 %30, label %31, label %117

31:                                               ; preds = %9
  %32 = icmp sgt i32 %20, 0
  br i1 %32, label %45, label %35

33:                                               ; preds = %45
  %34 = icmp slt i32 %53, %20
  br i1 %34, label %45, label %35, !llvm.loop !8

35:                                               ; preds = %33, %31
  %36 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !4, !amdgpu.noclobber !10
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %117

38:                                               ; preds = %35
  %39 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !4, !amdgpu.noclobber !10
  %40 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !4, !amdgpu.noclobber !10
  %41 = and i32 %36, 3
  %42 = icmp ult i32 %36, 4
  br i1 %42, label %99, label %43

43:                                               ; preds = %38
  %44 = and i32 %36, -4
  br label %54

45:                                               ; preds = %31, %33
  %46 = phi i32 [ %53, %33 ], [ 0, %31 ]
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %18, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !11, !amdgpu.noclobber !10
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 %47
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !11, !amdgpu.noclobber !10
  %52 = icmp eq i8 %49, %51
  %53 = add nuw nsw i32 %46, 1
  br i1 %52, label %33, label %117

54:                                               ; preds = %54, %43
  %55 = phi i32 [ 0, %43 ], [ %96, %54 ]
  %56 = phi i32 [ 0, %43 ], [ %97, %54 ]
  %57 = mul nsw i32 %39, %55
  %58 = add nsw i32 %57, %11
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %3, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !12
  %62 = mul nsw i32 %40, %55
  %63 = add nsw i32 %62, %10
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  store double %61, double addrspace(1)* %65, align 8, !tbaa !12
  %66 = or i32 %55, 1
  %67 = mul nsw i32 %39, %66
  %68 = add nsw i32 %67, %11
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %3, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !12
  %72 = mul nsw i32 %40, %66
  %73 = add nsw i32 %72, %10
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  store double %71, double addrspace(1)* %75, align 8, !tbaa !12
  %76 = or i32 %55, 2
  %77 = mul nsw i32 %39, %76
  %78 = add nsw i32 %77, %11
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %3, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !12
  %82 = mul nsw i32 %40, %76
  %83 = add nsw i32 %82, %10
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  store double %81, double addrspace(1)* %85, align 8, !tbaa !12
  %86 = or i32 %55, 3
  %87 = mul nsw i32 %39, %86
  %88 = add nsw i32 %87, %11
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double addrspace(1)* %3, i64 %89
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !12
  %92 = mul nsw i32 %40, %86
  %93 = add nsw i32 %92, %10
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double addrspace(1)* %0, i64 %94
  store double %91, double addrspace(1)* %95, align 8, !tbaa !12
  %96 = add nuw nsw i32 %55, 4
  %97 = add i32 %56, 4
  %98 = icmp eq i32 %97, %44
  br i1 %98, label %99, label %54, !llvm.loop !14

99:                                               ; preds = %54, %38
  %100 = phi i32 [ 0, %38 ], [ %96, %54 ]
  %101 = icmp eq i32 %41, 0
  br i1 %101, label %117, label %102

102:                                              ; preds = %99, %102
  %103 = phi i32 [ %114, %102 ], [ %100, %99 ]
  %104 = phi i32 [ %115, %102 ], [ 0, %99 ]
  %105 = mul nsw i32 %39, %103
  %106 = add nsw i32 %105, %11
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %3, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !12
  %110 = mul nsw i32 %40, %103
  %111 = add nsw i32 %110, %10
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %0, i64 %112
  store double %109, double addrspace(1)* %113, align 8, !tbaa !12
  %114 = add nuw nsw i32 %103, 1
  %115 = add i32 %104, 1
  %116 = icmp eq i32 %115, %41
  br i1 %116, label %117, label %102, !llvm.loop !15

117:                                              ; preds = %45, %99, %102, %35, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{}
!11 = !{!6, !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"double", !6, i64 0}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
