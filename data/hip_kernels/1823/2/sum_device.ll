; ModuleID = '../data/hip_kernels/1823/2/main.cu'
source_filename = "../data/hip_kernels/1823/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3sumPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %4, %3
  %5 = phi i32 [ 0, %3 ], [ %85, %4 ]
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !4
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %6
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !4
  %11 = add nsw i32 %10, %8
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %6
  store i32 %11, i32 addrspace(1)* %12, align 4, !tbaa !4
  %13 = or i32 %5, 1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !4
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !4
  %19 = add nsw i32 %18, %16
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  store i32 %19, i32 addrspace(1)* %20, align 4, !tbaa !4
  %21 = add nuw nsw i32 %5, 2
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !4
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !4
  %27 = add nsw i32 %26, %24
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  store i32 %27, i32 addrspace(1)* %28, align 4, !tbaa !4
  %29 = add nuw nsw i32 %5, 3
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !4
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !4
  %35 = add nsw i32 %34, %32
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  store i32 %35, i32 addrspace(1)* %36, align 4, !tbaa !4
  %37 = add nuw nsw i32 %5, 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !4
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !4
  %43 = add nsw i32 %42, %40
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  store i32 %43, i32 addrspace(1)* %44, align 4, !tbaa !4
  %45 = add nuw nsw i32 %5, 5
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !4
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !4
  %51 = add nsw i32 %50, %48
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !4
  %53 = add nuw nsw i32 %5, 6
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !4
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !4
  %59 = add nsw i32 %58, %56
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !4
  %61 = add nuw nsw i32 %5, 7
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !4
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %62
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !4
  %67 = add nsw i32 %66, %64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  store i32 %67, i32 addrspace(1)* %68, align 4, !tbaa !4
  %69 = add nuw nsw i32 %5, 8
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !4
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %70
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !4
  %75 = add nsw i32 %74, %72
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %70
  store i32 %75, i32 addrspace(1)* %76, align 4, !tbaa !4
  %77 = add nuw nsw i32 %5, 9
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !4
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !4
  %83 = add nsw i32 %82, %80
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %78
  store i32 %83, i32 addrspace(1)* %84, align 4, !tbaa !4
  %85 = add nuw nsw i32 %5, 10
  %86 = icmp eq i32 %85, 1000
  br i1 %86, label %87, label %4, !llvm.loop !8

87:                                               ; preds = %4
  ret void
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
!9 = !{!"llvm.loop.mustprogress"}
