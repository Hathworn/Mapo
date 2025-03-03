; ModuleID = '../data/hip_kernels/4012/2/main.cu'
source_filename = "../data/hip_kernels/4012/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7rectifyPhjji(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = shl i32 %1, 2
  %6 = mul i32 %5, %2
  %7 = udiv i32 %6, %3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul i32 %7, %8
  %10 = icmp sgt i32 %7, 0
  br i1 %10, label %11, label %54

11:                                               ; preds = %4
  %12 = icmp ult i32 %7, 4
  br i1 %12, label %52, label %13

13:                                               ; preds = %11
  %14 = and i32 %7, -4
  %15 = insertelement <4 x i32> poison, i32 %9, i64 0
  %16 = shufflevector <4 x i32> %15, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %17

17:                                               ; preds = %46, %13
  %18 = phi i32 [ 0, %13 ], [ %47, %46 ]
  %19 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %13 ], [ %48, %46 ]
  %20 = add nsw <4 x i32> %19, %16
  %21 = sext <4 x i32> %20 to <4 x i64>
  %22 = extractelement <4 x i64> %21, i64 0
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  %24 = bitcast i8 addrspace(1)* %23 to <4 x i8> addrspace(1)*
  %25 = load <4 x i8>, <4 x i8> addrspace(1)* %24, align 1, !tbaa !5
  %26 = icmp ult <4 x i8> %25, <i8 127, i8 127, i8 127, i8 127>
  %27 = extractelement <4 x i1> %26, i64 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %17
  %29 = extractelement <4 x i64> %21, i64 0
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  store i8 127, i8 addrspace(1)* %30, align 1, !tbaa !5
  br label %31

31:                                               ; preds = %28, %17
  %32 = extractelement <4 x i1> %26, i64 1
  br i1 %32, label %33, label %36

33:                                               ; preds = %31
  %34 = extractelement <4 x i64> %21, i64 1
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  store i8 127, i8 addrspace(1)* %35, align 1, !tbaa !5
  br label %36

36:                                               ; preds = %33, %31
  %37 = extractelement <4 x i1> %26, i64 2
  br i1 %37, label %38, label %41

38:                                               ; preds = %36
  %39 = extractelement <4 x i64> %21, i64 2
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %39
  store i8 127, i8 addrspace(1)* %40, align 1, !tbaa !5
  br label %41

41:                                               ; preds = %38, %36
  %42 = extractelement <4 x i1> %26, i64 3
  br i1 %42, label %43, label %46

43:                                               ; preds = %41
  %44 = extractelement <4 x i64> %21, i64 3
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  store i8 127, i8 addrspace(1)* %45, align 1, !tbaa !5
  br label %46

46:                                               ; preds = %43, %41
  %47 = add nuw i32 %18, 4
  %48 = add <4 x i32> %19, <i32 4, i32 4, i32 4, i32 4>
  %49 = icmp eq i32 %47, %14
  br i1 %49, label %50, label %17, !llvm.loop !8

50:                                               ; preds = %46
  %51 = icmp eq i32 %7, %14
  br i1 %51, label %54, label %52

52:                                               ; preds = %11, %50
  %53 = phi i32 [ 0, %11 ], [ %14, %50 ]
  br label %55

54:                                               ; preds = %63, %50, %4
  ret void

55:                                               ; preds = %52, %63
  %56 = phi i32 [ %64, %63 ], [ %53, %52 ]
  %57 = add nsw i32 %56, %9
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !5
  %61 = icmp ult i8 %60, 127
  br i1 %61, label %62, label %63

62:                                               ; preds = %55
  store i8 127, i8 addrspace(1)* %59, align 1, !tbaa !5
  br label %63

63:                                               ; preds = %62, %55
  %64 = add nuw nsw i32 %56, 1
  %65 = icmp eq i32 %64, %7
  br i1 %65, label %54, label %55, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
