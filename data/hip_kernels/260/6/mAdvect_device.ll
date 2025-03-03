; ModuleID = '../data/hip_kernels/260/6/main.cu'
source_filename = "../data/hip_kernels/260/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7mAdvectPfS_S_S_fff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = icmp eq i32 %14, 0
  %16 = add nsw i32 %13, -1
  %17 = icmp eq i32 %16, %14
  %18 = icmp eq i32 %8, 0
  %19 = icmp eq i32 %8, 479
  %20 = select i1 %15, i1 true, i1 %17
  %21 = select i1 %20, i1 true, i1 %18
  %22 = select i1 %21, i1 true, i1 %19
  br i1 %22, label %84, label %23

23:                                               ; preds = %7
  %24 = mul i32 %8, %13
  %25 = add i32 %24, %14
  %26 = uitofp i32 %14 to float
  %27 = uitofp i32 %8 to float
  %28 = fmul contract float %4, %5
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fmul contract float %28, %31
  %33 = fsub contract float %26, %32
  %34 = fmul contract float %4, %6
  %35 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fmul contract float %34, %36
  %38 = fsub contract float %27, %37
  %39 = fcmp contract olt float %33, 1.500000e+00
  %40 = select i1 %39, float 1.500000e+00, float %33
  %41 = fcmp contract ogt float %40, 6.375000e+02
  %42 = select i1 %41, float 6.375000e+02, float %40
  %43 = fcmp contract olt float %38, 1.500000e+00
  %44 = select i1 %43, float 1.500000e+00, float %38
  %45 = fcmp contract ogt float %44, 4.775000e+02
  %46 = select i1 %45, float 4.775000e+02, float %44
  %47 = fptosi float %42 to i32
  %48 = sitofp i32 %47 to float
  %49 = fsub contract float %42, %48
  %50 = fptosi float %46 to i32
  %51 = sitofp i32 %50 to float
  %52 = fsub contract float %46, %51
  %53 = mul i32 %50, %13
  %54 = add i32 %53, %47
  %55 = fmul contract float %49, %52
  %56 = add i32 %54, %13
  %57 = add i32 %56, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %60, %55
  %62 = fsub contract float 1.000000e+00, %52
  %63 = fmul contract float %49, %62
  %64 = add nsw i32 %54, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fmul contract float %67, %63
  %69 = fadd contract float %61, %68
  %70 = fsub contract float 1.000000e+00, %49
  %71 = fmul contract float %70, %52
  %72 = zext i32 %56 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %74, %71
  %76 = fadd contract float %75, %69
  %77 = fmul contract float %70, %62
  %78 = sext i32 %54 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = fmul contract float %80, %77
  %82 = fadd contract float %81, %76
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float %82, float addrspace(1)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %7, %23
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
