; ModuleID = '../data/hip_kernels/88/14/main.cu'
source_filename = "../data/hip_kernels/88/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4funcPciPiS_(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  %7 = and i32 %1, 7
  %8 = icmp ult i32 %1, 8
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = and i32 %1, -8
  br label %45

11:                                               ; preds = %45, %6
  %12 = phi i32 [ 0, %6 ], [ %86, %45 ]
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %24, label %14

14:                                               ; preds = %11, %14
  %15 = phi i32 [ %20, %14 ], [ %12, %11 ]
  %16 = phi i32 [ %22, %14 ], [ 0, %11 ]
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !4
  %20 = add nuw nsw i32 %15, 1
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %17
  store i8 %19, i8 addrspace(1)* %21, align 1, !tbaa !4
  %22 = add i32 %16, 1
  %23 = icmp eq i32 %22, %7
  br i1 %23, label %24, label %14, !llvm.loop !7

24:                                               ; preds = %11, %14, %4
  %25 = phi i32 [ 0, %4 ], [ %1, %14 ], [ %1, %11 ]
  %26 = bitcast i32 addrspace(1)* %2 to i8 addrspace(1)*
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !4
  %28 = add nuw nsw i32 %25, 1
  %29 = zext i32 %25 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %29
  store i8 %27, i8 addrspace(1)* %30, align 1, !tbaa !4
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %26, i64 1
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !4
  %33 = add nuw nsw i32 %25, 2
  %34 = zext i32 %28 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %34
  store i8 %32, i8 addrspace(1)* %35, align 1, !tbaa !4
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %26, i64 2
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !4
  %38 = add nuw nsw i32 %25, 3
  %39 = zext i32 %33 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %39
  store i8 %37, i8 addrspace(1)* %40, align 1, !tbaa !4
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %26, i64 3
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !4
  %43 = zext i32 %38 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %43
  store i8 %42, i8 addrspace(1)* %44, align 1, !tbaa !4
  ret void

45:                                               ; preds = %45, %9
  %46 = phi i32 [ 0, %9 ], [ %86, %45 ]
  %47 = phi i32 [ 0, %9 ], [ %88, %45 ]
  %48 = zext i32 %46 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !4
  %51 = or i32 %46, 1
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %48
  store i8 %50, i8 addrspace(1)* %52, align 1, !tbaa !4
  %53 = zext i32 %51 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !4
  %56 = or i32 %46, 2
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %53
  store i8 %55, i8 addrspace(1)* %57, align 1, !tbaa !4
  %58 = zext i32 %56 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !4
  %61 = or i32 %46, 3
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %58
  store i8 %60, i8 addrspace(1)* %62, align 1, !tbaa !4
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !4
  %66 = or i32 %46, 4
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %63
  store i8 %65, i8 addrspace(1)* %67, align 1, !tbaa !4
  %68 = zext i32 %66 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %68
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !4
  %71 = or i32 %46, 5
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %68
  store i8 %70, i8 addrspace(1)* %72, align 1, !tbaa !4
  %73 = zext i32 %71 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !4
  %76 = or i32 %46, 6
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %73
  store i8 %75, i8 addrspace(1)* %77, align 1, !tbaa !4
  %78 = zext i32 %76 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !4
  %81 = or i32 %46, 7
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %78
  store i8 %80, i8 addrspace(1)* %82, align 1, !tbaa !4
  %83 = zext i32 %81 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !4
  %86 = add nuw nsw i32 %46, 8
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %83
  store i8 %85, i8 addrspace(1)* %87, align 1, !tbaa !4
  %88 = add i32 %47, 8
  %89 = icmp eq i32 %88, %10
  br i1 %89, label %11, label %45, !llvm.loop !9
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
