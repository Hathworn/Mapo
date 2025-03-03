; ModuleID = '../data/hip_kernels/721/52/main.cu'
source_filename = "../data/hip_kernels/721/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3EFDiPfS_fffff(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float %3, float %4, float %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %87

19:                                               ; preds = %8
  %20 = add nsw i32 %17, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = fmul contract float %23, %3
  %25 = sext i32 %17 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = fmul contract float %27, %4
  %29 = fadd contract float %24, %28
  %30 = add nsw i32 %17, -1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = fmul contract float %33, %5
  %35 = fadd contract float %29, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = icmp eq i32 %17, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %19
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  br label %85

41:                                               ; preds = %19
  %42 = add nsw i32 %0, -1
  %43 = icmp eq i32 %17, %42
  br i1 %43, label %44, label %87

44:                                               ; preds = %41
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = sdiv i32 %17, 2
  %48 = sitofp i32 %47 to float
  %49 = fmul contract float %48, %7
  %50 = fadd contract float %49, %6
  %51 = fmul float %50, 0x3FF7154760000000
  %52 = tail call float @llvm.rint.f32(float %51)
  %53 = fcmp ogt float %50, 0x40562E4300000000
  %54 = fcmp olt float %50, 0xC059D1DA00000000
  %55 = fneg float %51
  %56 = tail call float @llvm.fma.f32(float %50, float 0x3FF7154760000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %50, float 0x3E54AE0BE0000000, float %56)
  %58 = fsub float %51, %52
  %59 = fadd float %57, %58
  %60 = tail call float @llvm.exp2.f32(float %59)
  %61 = fptosi float %52 to i32
  %62 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 %61)
  %63 = select i1 %54, float 0.000000e+00, float %62
  %64 = select i1 %53, float 0x7FF0000000000000, float %63
  %65 = fadd contract float %64, %46
  %66 = add nsw i32 %47, -1
  %67 = sitofp i32 %66 to float
  %68 = fmul contract float %67, %7
  %69 = fadd contract float %68, %6
  %70 = fmul float %69, 0x3FF7154760000000
  %71 = tail call float @llvm.rint.f32(float %70)
  %72 = fcmp ogt float %69, 0x40562E4300000000
  %73 = fcmp olt float %69, 0xC059D1DA00000000
  %74 = fneg float %70
  %75 = tail call float @llvm.fma.f32(float %69, float 0x3FF7154760000000, float %74)
  %76 = tail call float @llvm.fma.f32(float %69, float 0x3E54AE0BE0000000, float %75)
  %77 = fsub float %70, %71
  %78 = fadd float %76, %77
  %79 = tail call float @llvm.exp2.f32(float %78)
  %80 = fptosi float %71 to i32
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 %80)
  %82 = select i1 %73, float 0.000000e+00, float %81
  %83 = select i1 %72, float 0x7FF0000000000000, float %82
  %84 = fsub contract float %65, %83
  br label %85

85:                                               ; preds = %44, %38
  %86 = phi float [ %40, %38 ], [ %84, %44 ]
  store float %86, float addrspace(1)* %36, align 4, !tbaa !7
  br label %87

87:                                               ; preds = %85, %41, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
