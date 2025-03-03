; ModuleID = '../data/hip_kernels/5065/14/main.cu'
source_filename = "../data/hip_kernels/5065/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z10mandelbrotPiiii(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %66

25:                                               ; preds = %4
  %26 = sitofp i32 %21 to float
  %27 = fmul contract float %26, 4.000000e+00
  %28 = sitofp i32 %2 to float
  %29 = fdiv contract float %27, %28
  %30 = fadd contract float %29, -2.000000e+00
  %31 = icmp sgt i32 %1, 0
  br i1 %31, label %32, label %60

32:                                               ; preds = %25
  %33 = sitofp i32 %13 to float
  %34 = fmul contract float %33, 4.000000e+00
  %35 = sitofp i32 %3 to float
  %36 = fdiv contract float %34, %35
  %37 = fadd contract float %36, -2.000000e+00
  %38 = fpext float %37 to double
  br label %39

39:                                               ; preds = %32, %39
  %40 = phi i32 [ 0, %32 ], [ %43, %39 ]
  %41 = phi float [ 0.000000e+00, %32 ], [ %47, %39 ]
  %42 = phi float [ 0.000000e+00, %32 ], [ %53, %39 ]
  %43 = add nuw nsw i32 %40, 1
  %44 = fmul contract float %41, %41
  %45 = fmul contract float %42, %42
  %46 = fsub contract float %44, %45
  %47 = fadd contract float %30, %46
  %48 = fpext float %41 to double
  %49 = fmul contract double %48, 2.000000e+00
  %50 = fpext float %42 to double
  %51 = fmul contract double %49, %50
  %52 = fadd contract double %51, %38
  %53 = fptrunc double %52 to float
  %54 = fmul contract float %47, %47
  %55 = fmul contract float %53, %53
  %56 = fadd contract float %54, %55
  %57 = icmp slt i32 %43, %1
  %58 = fcmp contract ole float %56, 4.000000e+00
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %39, label %60, !llvm.loop !7

60:                                               ; preds = %39, %25
  %61 = phi i32 [ 0, %25 ], [ %43, %39 ]
  %62 = mul nsw i32 %13, %3
  %63 = add nsw i32 %62, %21
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  store i32 %61, i32 addrspace(1)* %65, align 4, !tbaa !9
  br label %66

66:                                               ; preds = %60, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
