; ModuleID = '../data/hip_kernels/17061/1/main.cu'
source_filename = "../data/hip_kernels/17061/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15vector_additionPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %27

6:                                                ; preds = %4
  %7 = and i32 %3, 7
  %8 = icmp ult i32 %3, 8
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = and i32 %3, -8
  br label %28

11:                                               ; preds = %28, %6
  %12 = phi i32 [ 0, %6 ], [ %94, %28 ]
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %27, label %14

14:                                               ; preds = %11, %14
  %15 = phi i32 [ %24, %14 ], [ %12, %11 ]
  %16 = phi i32 [ %25, %14 ], [ 0, %11 ]
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !4
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !4
  %22 = add nsw i32 %21, %19
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  store i32 %22, i32 addrspace(1)* %23, align 4, !tbaa !4
  %24 = add nuw nsw i32 %15, 1
  %25 = add i32 %16, 1
  %26 = icmp eq i32 %25, %7
  br i1 %26, label %27, label %14, !llvm.loop !8

27:                                               ; preds = %11, %14, %4
  ret void

28:                                               ; preds = %28, %9
  %29 = phi i32 [ 0, %9 ], [ %94, %28 ]
  %30 = phi i32 [ 0, %9 ], [ %95, %28 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !4
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !4
  %36 = add nsw i32 %35, %33
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  store i32 %36, i32 addrspace(1)* %37, align 4, !tbaa !4
  %38 = or i32 %29, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !4
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !4
  %44 = add nsw i32 %43, %41
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 %44, i32 addrspace(1)* %45, align 4, !tbaa !4
  %46 = or i32 %29, 2
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !4
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !4
  %52 = add nsw i32 %51, %49
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  store i32 %52, i32 addrspace(1)* %53, align 4, !tbaa !4
  %54 = or i32 %29, 3
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !4
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !4
  %60 = add nsw i32 %59, %57
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %55
  store i32 %60, i32 addrspace(1)* %61, align 4, !tbaa !4
  %62 = or i32 %29, 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !4
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !4
  %68 = add nsw i32 %67, %65
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !4
  %70 = or i32 %29, 5
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !4
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !4
  %76 = add nsw i32 %75, %73
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  store i32 %76, i32 addrspace(1)* %77, align 4, !tbaa !4
  %78 = or i32 %29, 6
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !4
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !4
  %84 = add nsw i32 %83, %81
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %79
  store i32 %84, i32 addrspace(1)* %85, align 4, !tbaa !4
  %86 = or i32 %29, 7
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !4
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %87
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !4
  %92 = add nsw i32 %91, %89
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %87
  store i32 %92, i32 addrspace(1)* %93, align 4, !tbaa !4
  %94 = add nuw nsw i32 %29, 8
  %95 = add i32 %30, 8
  %96 = icmp eq i32 %95, %10
  br i1 %96, label %11, label %28, !llvm.loop !10
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
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
