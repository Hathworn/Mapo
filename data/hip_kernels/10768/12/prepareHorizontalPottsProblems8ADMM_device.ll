; ModuleID = '../data/hip_kernels/10768/12/main.cu'
source_filename = "../data/hip_kernels/10768/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z35prepareHorizontalPottsProblems8ADMMPfS_S_S_S_S_S_S_S_S_fjjj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %15
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  %31 = add i32 %30, %24
  %32 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %34 = getelementptr i8, i8 addrspace(4)* %16, i64 8
  %35 = bitcast i8 addrspace(4)* %34 to i16 addrspace(4)*
  %36 = load i16, i16 addrspace(4)* %35, align 4, !range !5, !invariant.load !6
  %37 = zext i16 %36 to i32
  %38 = mul i32 %33, %37
  %39 = add i32 %38, %32
  %40 = icmp ult i32 %23, %11
  %41 = icmp ult i32 %31, %12
  %42 = select i1 %40, i1 %41, i1 false
  %43 = icmp ult i32 %39, %13
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %84

45:                                               ; preds = %14
  %46 = mul i32 %31, %11
  %47 = add i32 %46, %23
  %48 = mul i32 %12, %11
  %49 = mul i32 %48, %39
  %50 = add i32 %47, %49
  %51 = zext i32 %47 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = zext i32 %50 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = fmul contract float %53, %56
  %58 = fmul contract float %10, 2.000000e+00
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !6
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = fadd contract float %60, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fadd contract float %63, %65
  %67 = fmul contract float %58, %66
  %68 = fadd contract float %57, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %7, i64 %54
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = fneg contract float %70
  %72 = getelementptr inbounds float, float addrspace(1)* %8, i64 %54
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = fsub contract float %71, %73
  %75 = getelementptr inbounds float, float addrspace(1)* %9, i64 %54
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fsub contract float %74, %76
  %78 = fmul contract float %77, 2.000000e+00
  %79 = fadd contract float %68, %78
  %80 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = fdiv contract float %79, %81
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %82, float addrspace(1)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %45, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
