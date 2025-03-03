; ModuleID = '../data/hip_kernels/13803/16/main.cu'
source_filename = "../data/hip_kernels/13803/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z8MyKernelPfmii(float addrspace(1)* nocapture writeonly %0, i64 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = bitcast float addrspace(1)* %0 to i8 addrspace(1)*
  %8 = icmp sgt i32 %2, 0
  %9 = and i32 %2, 7
  %10 = icmp ult i32 %2, 8
  %11 = and i32 %2, -8
  %12 = icmp eq i32 %9, 0
  br label %14

13:                                               ; preds = %31, %4
  ret void

14:                                               ; preds = %6, %31
  %15 = phi i32 [ 0, %6 ], [ %32, %31 ]
  %16 = zext i32 %15 to i64
  %17 = mul i64 %16, %1
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %17
  %19 = bitcast i8 addrspace(1)* %18 to float addrspace(1)*
  br i1 %8, label %20, label %31

20:                                               ; preds = %14
  br i1 %10, label %21, label %34

21:                                               ; preds = %34, %20
  %22 = phi i32 [ 0, %20 ], [ %60, %34 ]
  br i1 %12, label %31, label %23

23:                                               ; preds = %21, %23
  %24 = phi i32 [ %28, %23 ], [ %22, %21 ]
  %25 = phi i32 [ %29, %23 ], [ 0, %21 ]
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %19, i64 %26
  store float 0x40314CCCC0000000, float addrspace(1)* %27, align 4, !tbaa !4
  %28 = add nuw nsw i32 %24, 1
  %29 = add i32 %25, 1
  %30 = icmp eq i32 %29, %9
  br i1 %30, label %31, label %23, !llvm.loop !8

31:                                               ; preds = %21, %23, %14
  %32 = add nuw nsw i32 %15, 1
  %33 = icmp eq i32 %32, %3
  br i1 %33, label %13, label %14, !llvm.loop !10

34:                                               ; preds = %20, %34
  %35 = phi i32 [ %60, %34 ], [ 0, %20 ]
  %36 = phi i32 [ %61, %34 ], [ 0, %20 ]
  %37 = zext i32 %35 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %19, i64 %37
  store float 0x40314CCCC0000000, float addrspace(1)* %38, align 4, !tbaa !4
  %39 = or i32 %35, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %19, i64 %40
  store float 0x40314CCCC0000000, float addrspace(1)* %41, align 4, !tbaa !4
  %42 = or i32 %35, 2
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %19, i64 %43
  store float 0x40314CCCC0000000, float addrspace(1)* %44, align 4, !tbaa !4
  %45 = or i32 %35, 3
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %19, i64 %46
  store float 0x40314CCCC0000000, float addrspace(1)* %47, align 4, !tbaa !4
  %48 = or i32 %35, 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %19, i64 %49
  store float 0x40314CCCC0000000, float addrspace(1)* %50, align 4, !tbaa !4
  %51 = or i32 %35, 5
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %19, i64 %52
  store float 0x40314CCCC0000000, float addrspace(1)* %53, align 4, !tbaa !4
  %54 = or i32 %35, 6
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %19, i64 %55
  store float 0x40314CCCC0000000, float addrspace(1)* %56, align 4, !tbaa !4
  %57 = or i32 %35, 7
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %19, i64 %58
  store float 0x40314CCCC0000000, float addrspace(1)* %59, align 4, !tbaa !4
  %60 = add nuw nsw i32 %35, 8
  %61 = add i32 %36, 8
  %62 = icmp eq i32 %61, %11
  br i1 %62, label %21, label %34, !llvm.loop !12
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
