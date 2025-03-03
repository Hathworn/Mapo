; ModuleID = '../data/hip_kernels/861/7/main.cu'
source_filename = "../data/hip_kernels/861/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7tonemapPfS_S_S_S_S_S_fffiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float %7, float %8, float %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %22, %12
  %32 = icmp slt i32 %30, %11
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %77

34:                                               ; preds = %13
  %35 = mul nsw i32 %30, %12
  %36 = add nsw i32 %35, %22
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = add nsw i32 %10, -1
  %45 = sitofp i32 %10 to float
  %46 = fsub contract float %43, %7
  %47 = fmul contract float %46, %45
  %48 = fdiv contract float %47, %9
  %49 = fptosi float %48 to i32
  %50 = tail call i32 @llvm.smin.i32(i32 %44, i32 %49)
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fdiv contract float %53, %41
  %55 = fmul contract float %39, %54
  %56 = fsub contract float 1.000000e+00, %39
  %57 = fsub contract float %56, %41
  %58 = fmul contract float %57, %54
  %59 = fmul contract float %55, 0x4009ECBFC0000000
  %60 = fmul contract float %53, 0x3FF8985F00000000
  %61 = fsub contract float %59, %60
  %62 = fmul contract float %58, 0x3FDFE91000000000
  %63 = fsub contract float %61, %62
  %64 = fmul contract float %55, 0x3FEF013AA0000000
  %65 = fmul contract float %53, 0x3FFE0346E0000000
  %66 = fsub contract float %65, %64
  %67 = fmul contract float %58, 0x3FA53F7CE0000000
  %68 = fadd contract float %67, %66
  %69 = fmul contract float %55, 0x3FAC84B5E0000000
  %70 = fmul contract float %53, 0x3FCA1CAC00000000
  %71 = fsub contract float %69, %70
  %72 = fmul contract float %58, 0x3FF0E978E0000000
  %73 = fadd contract float %72, %71
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  store float %63, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  store float %68, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = getelementptr inbounds float, float addrspace(1)* %6, i64 %37
  store float %73, float addrspace(1)* %76, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %34, %13
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
