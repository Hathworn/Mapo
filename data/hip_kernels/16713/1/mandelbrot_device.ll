; ModuleID = '../data/hip_kernels/16713/1/main.cu'
source_filename = "../data/hip_kernels/16713/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z10mandelbrotiifffffPf(i32 %0, i32 %1, float %2, float %3, float %4, float %5, float %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp slt i32 %17, %1
  %27 = icmp slt i32 %25, %0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %71

29:                                               ; preds = %8
  %30 = mul nsw i32 %25, %1
  %31 = add nsw i32 %30, %17
  %32 = sitofp i32 %17 to float
  %33 = sitofp i32 %1 to float
  %34 = fdiv contract float %32, %33
  %35 = fsub contract float %4, %3
  %36 = fmul contract float %35, %34
  %37 = fadd contract float %36, %3
  %38 = sub nsw i32 %0, %25
  %39 = sitofp i32 %38 to float
  %40 = sitofp i32 %0 to float
  %41 = fdiv contract float %39, %40
  %42 = fsub contract float %6, %5
  %43 = fmul contract float %42, %41
  %44 = fadd contract float %43, %5
  %45 = fcmp contract ult float %2, 0.000000e+00
  br i1 %45, label %66, label %46

46:                                               ; preds = %29, %46
  %47 = phi float [ %59, %46 ], [ 0.000000e+00, %29 ]
  %48 = phi float [ %58, %46 ], [ 0.000000e+00, %29 ]
  %49 = phi i32 [ %57, %46 ], [ 0, %29 ]
  %50 = phi float [ %53, %46 ], [ 0.000000e+00, %29 ]
  %51 = phi float [ %56, %46 ], [ 0.000000e+00, %29 ]
  %52 = fsub contract float %48, %47
  %53 = fadd contract float %37, %52
  %54 = fmul contract float %50, 2.000000e+00
  %55 = fmul contract float %51, %54
  %56 = fadd contract float %44, %55
  %57 = add nuw nsw i32 %49, 1
  %58 = fmul contract float %53, %53
  %59 = fmul contract float %56, %56
  %60 = fadd contract float %59, %58
  %61 = fcmp contract ole float %60, %2
  %62 = icmp ult i32 %49, 9999
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %46, label %64, !llvm.loop !7

64:                                               ; preds = %46
  %65 = sitofp i32 %57 to float
  br label %66

66:                                               ; preds = %64, %29
  %67 = phi float [ 0.000000e+00, %29 ], [ %65, %64 ]
  %68 = fdiv contract float %67, 1.000000e+04
  %69 = sext i32 %31 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %7, i64 %69
  store float %68, float addrspace(1)* %70, align 4, !tbaa !9
  br label %71

71:                                               ; preds = %8, %66
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
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
