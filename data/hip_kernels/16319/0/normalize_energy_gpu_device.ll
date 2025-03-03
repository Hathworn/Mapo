; ModuleID = '../data/hip_kernels/16319/0/main.cu'
source_filename = "../data/hip_kernels/16319/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20normalize_energy_gpuPfS_ddS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, double %2, double %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
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
  %28 = icmp slt i32 %19, %6
  br i1 %28, label %29, label %80

29:                                               ; preds = %10
  %30 = sext i32 %19 to i64
  %31 = sub nsw i32 %7, %9
  %32 = icmp slt i32 %27, %31
  br i1 %32, label %33, label %80

33:                                               ; preds = %29
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = add nsw i32 %27, %9
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fsub contract float %41, %37
  %45 = fpext float %44 to double
  %46 = fsub contract double %2, %45
  %47 = fadd contract double %45, %2
  %48 = fmul contract double %46, %46
  %49 = fmul contract double %3, %3
  %50 = fadd contract double %49, %48
  %51 = fdiv contract double %46, %50
  %52 = fmul contract double %47, %47
  %53 = fadd contract double %49, %52
  %54 = fdiv contract double %47, %53
  %55 = fsub contract double %51, %54
  %56 = fdiv contract double %3, %53
  %57 = fdiv double %3, %50
  %58 = fsub contract double %56, %57
  %59 = mul nsw i32 %19, %8
  %60 = add nsw i32 %59, %27
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = getelementptr inbounds float, float addrspace(1)* %5, i64 %61
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fsub contract float %35, %43
  %67 = fpext float %66 to double
  %68 = fpext float %63 to double
  %69 = fmul contract double %55, %68
  %70 = fpext float %65 to double
  %71 = fmul contract double %58, %70
  %72 = fsub contract double %69, %71
  %73 = fmul contract double %72, %67
  %74 = fptrunc double %73 to float
  store float %74, float addrspace(1)* %62, align 4, !tbaa !7
  %75 = fmul contract double %58, %68
  %76 = fmul contract double %55, %70
  %77 = fadd contract double %75, %76
  %78 = fmul contract double %77, %67
  %79 = fptrunc double %78 to float
  store float %79, float addrspace(1)* %64, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %29, %33, %10
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
