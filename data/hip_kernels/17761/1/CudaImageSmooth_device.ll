; ModuleID = '../data/hip_kernels/17761/1/main.cu'
source_filename = "../data/hip_kernels/17761/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15CudaImageSmoothPhS_iii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = sdiv i32 %4, 2
  %24 = icmp slt i32 %14, %23
  br i1 %24, label %62, label %25

25:                                               ; preds = %5
  %26 = sub nsw i32 %2, %23
  %27 = icmp sgt i32 %14, %26
  %28 = add nsw i32 %4, -2
  %29 = icmp slt i32 %22, %28
  %30 = select i1 %27, i1 true, i1 %29
  %31 = icmp sgt i32 %22, %26
  %32 = select i1 %30, i1 true, i1 %31
  br i1 %32, label %62, label %33

33:                                               ; preds = %25
  %34 = sdiv i32 %4, -2
  %35 = icmp sgt i32 %34, %23
  br i1 %35, label %56, label %36

36:                                               ; preds = %33, %53
  %37 = phi float [ %50, %53 ], [ 0.000000e+00, %33 ]
  %38 = phi i32 [ %54, %53 ], [ %34, %33 ]
  %39 = add nsw i32 %38, %22
  %40 = mul nsw i32 %39, %2
  %41 = add i32 %40, %14
  br label %42

42:                                               ; preds = %36, %42
  %43 = phi float [ %37, %36 ], [ %50, %42 ]
  %44 = phi i32 [ %34, %36 ], [ %51, %42 ]
  %45 = add i32 %41, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  %49 = uitofp i8 %48 to float
  %50 = fadd contract float %43, %49
  %51 = add nsw i32 %44, 1
  %52 = icmp slt i32 %44, %23
  br i1 %52, label %42, label %53, !llvm.loop !10

53:                                               ; preds = %42
  %54 = add nsw i32 %38, 1
  %55 = icmp slt i32 %38, %23
  br i1 %55, label %36, label %56, !llvm.loop !12

56:                                               ; preds = %53, %33
  %57 = phi float [ 0.000000e+00, %33 ], [ %50, %53 ]
  %58 = mul nsw i32 %4, %4
  %59 = sitofp i32 %58 to float
  %60 = fdiv contract float %57, %59
  %61 = fptoui float %60 to i8
  br label %62

62:                                               ; preds = %5, %25, %56
  %63 = phi i8 [ %61, %56 ], [ 0, %25 ], [ 0, %5 ]
  %64 = mul nsw i32 %22, %2
  %65 = add nsw i32 %64, %14
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %66
  store i8 %63, i8 addrspace(1)* %67, align 1, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
