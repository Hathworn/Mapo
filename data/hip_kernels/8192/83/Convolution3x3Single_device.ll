; ModuleID = '../data/hip_kernels/8192/83/main.cu'
source_filename = "../data/hip_kernels/8192/83/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_KERNEL = protected addrspace(4) externally_initialized global [9 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([9 x float] addrspace(4)* @D_KERNEL to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20Convolution3x3SinglePfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %14
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %13
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %21
  %25 = mul nsw i32 %3, %2
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %121

27:                                               ; preds = %4
  %28 = freeze i32 %24
  %29 = freeze i32 %2
  %30 = sdiv i32 %28, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %28, %31
  %33 = tail call i32 @llvm.smax.i32(i32 %32, i32 1)
  %34 = add nsw i32 %33, -1
  %35 = add nsw i32 %2, -1
  %36 = tail call i32 @llvm.smin.i32(i32 %34, i32 %35)
  %37 = tail call i32 @llvm.smax.i32(i32 %30, i32 1)
  %38 = add nsw i32 %37, -1
  %39 = add nsw i32 %3, -1
  %40 = tail call i32 @llvm.smin.i32(i32 %38, i32 %39)
  %41 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 0), align 16, !tbaa !16
  %42 = mul nsw i32 %40, %2
  %43 = add nsw i32 %42, %36
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !5
  %47 = fmul contract float %41, %46
  %48 = fadd contract float %47, 0.000000e+00
  %49 = tail call i32 @llvm.smax.i32(i32 %30, i32 0)
  %50 = tail call i32 @llvm.smin.i32(i32 %49, i32 %39)
  %51 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 3), align 4, !tbaa !16
  %52 = mul nsw i32 %50, %2
  %53 = add nsw i32 %52, %36
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !5
  %57 = fmul contract float %51, %56
  %58 = fadd contract float %48, %57
  %59 = tail call i32 @llvm.smax.i32(i32 %30, i32 -1)
  %60 = add nsw i32 %59, 1
  %61 = tail call i32 @llvm.smin.i32(i32 %60, i32 %39)
  %62 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 6), align 8, !tbaa !16
  %63 = mul nsw i32 %61, %2
  %64 = add nsw i32 %63, %36
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !5
  %68 = fmul contract float %62, %67
  %69 = fadd contract float %58, %68
  %70 = tail call i32 @llvm.smax.i32(i32 %32, i32 0)
  %71 = tail call i32 @llvm.smin.i32(i32 %70, i32 %35)
  %72 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 1), align 4, !tbaa !16
  %73 = add nsw i32 %42, %71
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !5
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %69, %77
  %79 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 4), align 16, !tbaa !16
  %80 = add nsw i32 %52, %71
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !5
  %84 = fmul contract float %79, %83
  %85 = fadd contract float %78, %84
  %86 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 7), align 4, !tbaa !16
  %87 = add nsw i32 %63, %71
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !5
  %91 = fmul contract float %86, %90
  %92 = fadd contract float %85, %91
  %93 = tail call i32 @llvm.smax.i32(i32 %32, i32 -1)
  %94 = add nsw i32 %93, 1
  %95 = tail call i32 @llvm.smin.i32(i32 %94, i32 %35)
  %96 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 2), align 8, !tbaa !16
  %97 = add nsw i32 %42, %95
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16, !amdgpu.noclobber !5
  %101 = fmul contract float %96, %100
  %102 = fadd contract float %92, %101
  %103 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 5), align 4, !tbaa !16
  %104 = add nsw i32 %52, %95
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16, !amdgpu.noclobber !5
  %108 = fmul contract float %103, %107
  %109 = fadd contract float %102, %108
  %110 = load float, float addrspace(4)* getelementptr inbounds ([9 x float], [9 x float] addrspace(4)* @D_KERNEL, i64 0, i64 8), align 16, !tbaa !16
  %111 = add nsw i32 %63, %95
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !5
  %115 = fmul contract float %110, %114
  %116 = fadd contract float %109, %115
  %117 = mul nsw i32 %30, %2
  %118 = add nsw i32 %117, %32
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  store float %116, float addrspace(1)* %120, align 4, !tbaa !16
  br label %121

121:                                              ; preds = %27, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
