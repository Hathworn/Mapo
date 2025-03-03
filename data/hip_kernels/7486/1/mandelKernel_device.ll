; ModuleID = '../data/hip_kernels/7486/1/main.cu'
source_filename = "../data/hip_kernels/7486/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z12mandelKernelddddiPjiiiii(double %0, double %1, double %2, double %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = shl nsw i32 %10, 3
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %21, %28
  %30 = add i32 %29, %27
  %31 = mul nsw i32 %30, %8
  %32 = add nsw i32 %31, %9
  %33 = icmp slt i32 %32, %7
  br i1 %33, label %34, label %69

34:                                               ; preds = %11
  %35 = sitofp i32 %20 to double
  %36 = fmul contract double %35, %0
  %37 = fadd contract double %36, %2
  %38 = add nsw i32 %7, -1
  %39 = sitofp i32 %38 to double
  %40 = sitofp i32 %32 to double
  %41 = fsub contract double %39, %40
  %42 = fmul contract double %41, %1
  %43 = fadd contract double %42, %3
  br label %44

44:                                               ; preds = %44, %34
  %45 = phi double [ 0.000000e+00, %34 ], [ %54, %44 ]
  %46 = phi double [ 0.000000e+00, %34 ], [ %51, %44 ]
  %47 = phi i32 [ 0, %34 ], [ %55, %44 ]
  %48 = fmul contract double %46, %46
  %49 = fmul contract double %45, %45
  %50 = fsub contract double %48, %49
  %51 = fadd contract double %37, %50
  %52 = fmul contract double %45, %46
  %53 = fmul contract double %52, 2.000000e+00
  %54 = fadd contract double %43, %53
  %55 = add nuw nsw i32 %47, 1
  %56 = fmul contract double %51, %51
  %57 = fmul contract double %54, %54
  %58 = fadd contract double %56, %57
  %59 = icmp slt i32 %55, %4
  %60 = fcmp contract ole double %58, 4.000000e+00
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %44, label %62, !llvm.loop !7

62:                                               ; preds = %44
  %63 = icmp eq i32 %55, %4
  %64 = select i1 %63, i32 0, i32 %55
  %65 = mul nsw i32 %30, %6
  %66 = add nsw i32 %65, %20
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %67
  store i32 %64, i32 addrspace(1)* %68, align 4, !tbaa !9
  br label %69

69:                                               ; preds = %11, %62
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
