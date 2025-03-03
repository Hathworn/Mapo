; ModuleID = '../data/hip_kernels/15063/5/main.cu'
source_filename = "../data/hip_kernels/15063/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15ApplySecondPoolPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = mul nsw i32 %11, 292
  %13 = mul nsw i32 %11, 73
  br label %15

14:                                               ; preds = %15
  ret void

15:                                               ; preds = %61, %2
  %16 = phi i32 [ 0, %2 ], [ %104, %61 ]
  %17 = shl nuw nsw i32 %16, 1
  %18 = add nsw i32 %17, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %22 = or i32 %18, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %26 = tail call float @llvm.maxnum.f32(float %21, float %25)
  %27 = add nsw i32 %18, 146
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = tail call float @llvm.maxnum.f32(float %26, float %30)
  %32 = add nsw i32 %18, 147
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = tail call float @llvm.maxnum.f32(float %31, float %35)
  %37 = add nsw i32 %16, %13
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = fmul contract float %36, 2.000000e+00
  %41 = fadd contract float %40, -1.000000e+00
  %42 = fneg contract float %41
  %43 = fmul float %41, 0xBFF7154760000000
  %44 = tail call float @llvm.rint.f32(float %43)
  %45 = fcmp olt float %41, 0xC0562E4300000000
  %46 = fcmp ogt float %41, 0x4059D1DA00000000
  %47 = fneg float %43
  %48 = tail call float @llvm.fma.f32(float %42, float 0x3FF7154760000000, float %47)
  %49 = tail call float @llvm.fma.f32(float %42, float 0x3E54AE0BE0000000, float %48)
  %50 = fsub float %43, %44
  %51 = fadd float %49, %50
  %52 = tail call float @llvm.exp2.f32(float %51)
  %53 = fptosi float %44 to i32
  %54 = tail call float @llvm.amdgcn.ldexp.f32(float %52, i32 %53)
  %55 = fadd contract float %54, 1.000000e+00
  %56 = fdiv contract float 1.000000e+00, %55
  %57 = select i1 %46, float 1.000000e+00, float %56
  %58 = select i1 %45, float 0.000000e+00, float %57
  store float %58, float addrspace(1)* %39, align 4, !tbaa !7
  %59 = or i32 %16, 1
  %60 = icmp eq i32 %59, 73
  br i1 %60, label %14, label %61, !llvm.loop !11

61:                                               ; preds = %15
  %62 = shl nuw nsw i32 %59, 1
  %63 = add nsw i32 %62, %12
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = or i32 %63, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = tail call float @llvm.maxnum.f32(float %66, float %70)
  %72 = add nsw i32 %63, 146
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = tail call float @llvm.maxnum.f32(float %71, float %75)
  %77 = add nsw i32 %63, 147
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = tail call float @llvm.maxnum.f32(float %76, float %80)
  %82 = add nsw i32 %59, %13
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = fmul contract float %81, 2.000000e+00
  %86 = fadd contract float %85, -1.000000e+00
  %87 = fneg contract float %86
  %88 = fmul float %86, 0xBFF7154760000000
  %89 = tail call float @llvm.rint.f32(float %88)
  %90 = fcmp olt float %86, 0xC0562E4300000000
  %91 = fcmp ogt float %86, 0x4059D1DA00000000
  %92 = fneg float %88
  %93 = tail call float @llvm.fma.f32(float %87, float 0x3FF7154760000000, float %92)
  %94 = tail call float @llvm.fma.f32(float %87, float 0x3E54AE0BE0000000, float %93)
  %95 = fsub float %88, %89
  %96 = fadd float %94, %95
  %97 = tail call float @llvm.exp2.f32(float %96)
  %98 = fptosi float %89 to i32
  %99 = tail call float @llvm.amdgcn.ldexp.f32(float %97, i32 %98)
  %100 = fadd contract float %99, 1.000000e+00
  %101 = fdiv contract float 1.000000e+00, %100
  %102 = select i1 %91, float 1.000000e+00, float %101
  %103 = select i1 %90, float 0.000000e+00, float %102
  store float %103, float addrspace(1)* %84, align 4, !tbaa !7
  %104 = add nuw nsw i32 %16, 2
  br label %15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
