; ModuleID = '../data/hip_kernels/132/10/main.cu'
source_filename = "../data/hip_kernels/132/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9signedGPUiPiS_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %7, label %33

7:                                                ; preds = %5
  %8 = and i32 %0, 3
  %9 = icmp ult i32 %0, 4
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = and i32 %0, -4
  br label %34

12:                                               ; preds = %34, %7
  %13 = phi i32 [ 0, %7 ], [ %88, %34 ]
  %14 = icmp eq i32 %8, 0
  br i1 %14, label %33, label %15

15:                                               ; preds = %12, %15
  %16 = phi i32 [ %30, %15 ], [ %13, %12 ]
  %17 = phi i32 [ %31, %15 ], [ 0, %12 ]
  %18 = zext i32 %16 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !4
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !4
  %23 = freeze i32 %20
  %24 = freeze i32 %22
  %25 = sdiv i32 %23, %24
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %18
  store i32 %25, i32 addrspace(1)* %26, align 4, !tbaa !4
  %27 = mul i32 %25, %24
  %28 = sub i32 %23, %27
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %18
  store i32 %28, i32 addrspace(1)* %29, align 4, !tbaa !4
  %30 = add nuw nsw i32 %16, 1
  %31 = add i32 %17, 1
  %32 = icmp eq i32 %31, %8
  br i1 %32, label %33, label %15, !llvm.loop !8

33:                                               ; preds = %12, %15, %5
  ret void

34:                                               ; preds = %34, %10
  %35 = phi i32 [ 0, %10 ], [ %88, %34 ]
  %36 = phi i32 [ 0, %10 ], [ %89, %34 ]
  %37 = zext i32 %35 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !4
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !4
  %42 = freeze i32 %39
  %43 = freeze i32 %41
  %44 = sdiv i32 %42, %43
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %37
  store i32 %44, i32 addrspace(1)* %45, align 4, !tbaa !4
  %46 = mul i32 %44, %43
  %47 = sub i32 %42, %46
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %37
  store i32 %47, i32 addrspace(1)* %48, align 4, !tbaa !4
  %49 = or i32 %35, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !4
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !4
  %55 = freeze i32 %52
  %56 = freeze i32 %54
  %57 = sdiv i32 %55, %56
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %50
  store i32 %57, i32 addrspace(1)* %58, align 4, !tbaa !4
  %59 = mul i32 %57, %56
  %60 = sub i32 %55, %59
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %50
  store i32 %60, i32 addrspace(1)* %61, align 4, !tbaa !4
  %62 = or i32 %35, 2
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !4
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !4
  %68 = freeze i32 %65
  %69 = freeze i32 %67
  %70 = sdiv i32 %68, %69
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %63
  store i32 %70, i32 addrspace(1)* %71, align 4, !tbaa !4
  %72 = mul i32 %70, %69
  %73 = sub i32 %68, %72
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %63
  store i32 %73, i32 addrspace(1)* %74, align 4, !tbaa !4
  %75 = or i32 %35, 3
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !4
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !4
  %81 = freeze i32 %78
  %82 = freeze i32 %80
  %83 = sdiv i32 %81, %82
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %76
  store i32 %83, i32 addrspace(1)* %84, align 4, !tbaa !4
  %85 = mul i32 %83, %82
  %86 = sub i32 %81, %85
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !4
  %88 = add nuw nsw i32 %35, 4
  %89 = add i32 %36, 4
  %90 = icmp eq i32 %89, %11
  br i1 %90, label %12, label %34, !llvm.loop !10
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
