; ModuleID = '../data/hip_kernels/7486/3/main.cu'
source_filename = "../data/hip_kernels/7486/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z12mandelKernelddddiPjiiii(double %0, double %1, double %2, double %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = mul nsw i32 %27, %8
  %29 = add nsw i32 %28, %9
  %30 = sitofp i32 %19 to double
  %31 = fmul contract double %30, %0
  %32 = fadd contract double %31, %2
  %33 = add nsw i32 %7, -1
  %34 = sitofp i32 %33 to double
  %35 = sitofp i32 %29 to double
  %36 = fsub contract double %34, %35
  %37 = fmul contract double %36, %1
  %38 = fadd contract double %37, %3
  br label %39

39:                                               ; preds = %39, %10
  %40 = phi double [ 0.000000e+00, %10 ], [ %49, %39 ]
  %41 = phi double [ 0.000000e+00, %10 ], [ %46, %39 ]
  %42 = phi i32 [ 0, %10 ], [ %50, %39 ]
  %43 = fmul contract double %41, %41
  %44 = fmul contract double %40, %40
  %45 = fsub contract double %43, %44
  %46 = fadd contract double %32, %45
  %47 = fmul contract double %40, %41
  %48 = fmul contract double %47, 2.000000e+00
  %49 = fadd contract double %38, %48
  %50 = add nuw nsw i32 %42, 1
  %51 = fmul contract double %46, %46
  %52 = fmul contract double %49, %49
  %53 = fadd contract double %51, %52
  %54 = icmp slt i32 %50, %4
  %55 = fcmp contract ole double %53, 4.000000e+00
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %39, label %57, !llvm.loop !7

57:                                               ; preds = %39
  %58 = icmp eq i32 %50, %4
  %59 = select i1 %58, i32 0, i32 %50
  %60 = mul nsw i32 %27, %6
  %61 = add nsw i32 %60, %19
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %62
  store i32 %59, i32 addrspace(1)* %63, align 4, !tbaa !9
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
