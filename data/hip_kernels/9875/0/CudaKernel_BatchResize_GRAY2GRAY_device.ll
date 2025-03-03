; ModuleID = '../data/hip_kernels/9875/0/main.cu'
source_filename = "../data/hip_kernels/9875/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z32CudaKernel_BatchResize_GRAY2GRAYiPhiPiiiPf(i32 %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %5, %4
  %18 = mul nsw i32 %17, %2
  %19 = icmp sgt i32 %18, %16
  br i1 %19, label %20, label %113

20:                                               ; preds = %7
  %21 = freeze i32 %16
  %22 = freeze i32 %17
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = shl nsw i32 %23, 2
  %27 = add nuw nsw i32 %26, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = sitofp i32 %30 to float
  %32 = sitofp i32 %4 to float
  %33 = fdiv contract float %31, %32
  %34 = freeze i32 %4
  %35 = sdiv i32 %25, %34
  %36 = mul i32 %35, %34
  %37 = sub i32 %25, %36
  %38 = sitofp i32 %37 to float
  %39 = fadd contract float %38, 5.000000e-01
  %40 = fmul contract float %33, %39
  %41 = fadd contract float %40, -5.000000e-01
  %42 = tail call float @llvm.floor.f32(float %41)
  %43 = fptosi float %42 to i32
  %44 = sitofp i32 %43 to float
  %45 = fsub contract float %44, %41
  %46 = fadd contract float %45, 1.000000e+00
  %47 = add nuw nsw i32 %26, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = sitofp i32 %50 to float
  %52 = sitofp i32 %5 to float
  %53 = fdiv contract float %51, %52
  %54 = sitofp i32 %35 to float
  %55 = fadd contract float %54, 5.000000e-01
  %56 = fmul contract float %53, %55
  %57 = fadd contract float %56, -5.000000e-01
  %58 = tail call float @llvm.floor.f32(float %57)
  %59 = fptosi float %58 to i32
  %60 = sitofp i32 %59 to float
  %61 = fsub contract float %60, %57
  %62 = fadd contract float %61, 1.000000e+00
  %63 = sext i32 %26 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = add nuw nsw i32 %26, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = add nsw i32 %69, %59
  %71 = mul nsw i32 %70, %0
  %72 = add nsw i32 %65, %43
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !11, !amdgpu.noclobber !5
  %77 = uitofp i8 %76 to float
  %78 = fmul contract float %46, %77
  %79 = fmul contract float %78, %62
  %80 = fadd contract float %79, 0.000000e+00
  %81 = add nsw i32 %72, 1
  %82 = add nsw i32 %71, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !11, !amdgpu.noclobber !5
  %86 = uitofp i8 %85 to float
  %87 = fsub contract float 1.000000e+00, %46
  %88 = fmul contract float %87, %86
  %89 = fmul contract float %88, %62
  %90 = fadd contract float %89, %80
  %91 = add nsw i32 %70, 1
  %92 = mul nsw i32 %91, %0
  %93 = add nsw i32 %92, %72
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !11, !amdgpu.noclobber !5
  %97 = uitofp i8 %96 to float
  %98 = fmul contract float %46, %97
  %99 = fsub contract float 1.000000e+00, %62
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %100, %90
  %102 = add nsw i32 %92, %81
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %103
  %105 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !11, !amdgpu.noclobber !5
  %106 = uitofp i8 %105 to float
  %107 = fmul contract float %87, %106
  %108 = fmul contract float %107, %99
  %109 = fadd contract float %108, %101
  %110 = fdiv contract float %109, 2.550000e+02
  %111 = zext i32 %16 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %6, i64 %111
  store float %110, float addrspace(1)* %112, align 4, !tbaa !12
  br label %113

113:                                              ; preds = %7, %20
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
