; ModuleID = '../data/hip_kernels/11654/36/main.cu'
source_filename = "../data/hip_kernels/11654/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z23rnorm_all_in_one_kernelPfiff(float addrspace(1)* nocapture writeonly %0, i32 %1, float %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = mul i32 %21, %29
  %34 = add i32 %33, %30
  %35 = mul i32 %34, %25
  %36 = add i32 %35, %31
  %37 = mul i32 %36, %14
  %38 = add i32 %37, %32
  %39 = mul nsw i32 %38, 17
  %40 = add nsw i32 %39, 9131
  %41 = xor i32 %40, 746559103
  %42 = icmp sgt i32 %38, -538
  %43 = mul i32 %41, 1228688033
  %44 = add i32 %43, 123456789
  %45 = xor i32 %43, 362436069
  %46 = add i32 %43, 5783321
  %47 = select i1 %42, i32 -1966976488, i32 -93451411
  %48 = add i32 %47, %43
  %49 = icmp slt i32 %38, %1
  br i1 %49, label %50, label %116

50:                                               ; preds = %4
  %51 = lshr i32 %44, 2
  %52 = xor i32 %51, %44
  %53 = shl i32 %46, 4
  %54 = shl i32 %52, 1
  %55 = xor i32 %53, %54
  %56 = xor i32 %55, %46
  %57 = xor i32 %56, %52
  %58 = add i32 %48, 362437
  %59 = add i32 %58, %57
  %60 = lshr i32 %45, 2
  %61 = xor i32 %60, %45
  %62 = shl i32 %57, 4
  %63 = shl i32 %61, 1
  %64 = xor i32 %63, %62
  %65 = xor i32 %64, %61
  %66 = xor i32 %65, %57
  %67 = add i32 %48, 724874
  %68 = add i32 %67, %66
  %69 = uitofp i32 %59 to float
  %70 = fmul contract float %69, 0x3DF0000000000000
  %71 = fadd contract float %70, 0x3DF0000000000000
  %72 = uitofp i32 %68 to float
  %73 = fmul contract float %72, 0x3E1921FB60000000
  %74 = fadd contract float %73, 0x3E1921FB60000000
  %75 = tail call i1 @llvm.amdgcn.class.f32(float %71, i32 144)
  %76 = select i1 %75, float 0x41F0000000000000, float 1.000000e+00
  %77 = fmul float %71, %76
  %78 = tail call float @llvm.log2.f32(float %77)
  %79 = fmul float %78, 0x3FE62E42E0000000
  %80 = tail call i1 @llvm.amdgcn.class.f32(float %78, i32 519)
  %81 = fneg float %79
  %82 = tail call float @llvm.fma.f32(float %78, float 0x3FE62E42E0000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %78, float 0x3E6EFA39E0000000, float %82)
  %84 = fadd float %79, %83
  %85 = select i1 %80, float %78, float %84
  %86 = select i1 %75, float 0x40362E4300000000, float 0.000000e+00
  %87 = fsub float %85, %86
  %88 = fmul contract float %87, -2.000000e+00
  %89 = fcmp olt float %88, 0x39F0000000000000
  %90 = select i1 %89, float 0x41F0000000000000, float 1.000000e+00
  %91 = fmul float %88, %90
  %92 = tail call float @llvm.sqrt.f32(float %91)
  %93 = bitcast float %92 to i32
  %94 = add nsw i32 %93, -1
  %95 = bitcast i32 %94 to float
  %96 = add nsw i32 %93, 1
  %97 = bitcast i32 %96 to float
  %98 = tail call i1 @llvm.amdgcn.class.f32(float %91, i32 608)
  %99 = select i1 %89, float 0x3EF0000000000000, float 1.000000e+00
  %100 = fneg float %97
  %101 = tail call float @llvm.fma.f32(float %100, float %92, float %91)
  %102 = fcmp ogt float %101, 0.000000e+00
  %103 = fneg float %95
  %104 = tail call float @llvm.fma.f32(float %103, float %92, float %91)
  %105 = fcmp ole float %104, 0.000000e+00
  %106 = select i1 %105, float %95, float %92
  %107 = select i1 %102, float %97, float %106
  %108 = fmul float %99, %107
  %109 = select i1 %98, float %91, float %108
  %110 = tail call float @llvm.sin.f32(float %74)
  %111 = fmul contract float %110, %109
  %112 = fmul contract float %111, %3
  %113 = fadd contract float %112, %2
  %114 = sext i32 %38 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  store float %113, float addrspace(1)* %115, align 4, !tbaa !16
  br label %116

116:                                              ; preds = %50, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sin.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
