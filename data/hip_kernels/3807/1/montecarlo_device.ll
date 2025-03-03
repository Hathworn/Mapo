; ModuleID = '../data/hip_kernels/3807/1/main.cu'
source_filename = "../data/hip_kernels/3807/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10montecarloPfffffiE4lowx = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ10montecarloPfffffiE5highx = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ10montecarloPfffffiE4lowy = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ10montecarloPfffffiE5highy = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ10montecarloPfffffiE5iters = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10montecarloPfffffi(float addrspace(1)* nocapture writeonly %0, float %1, float %2, float %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %6
  store float %1, float addrspace(3)* @_ZZ10montecarloPfffffiE4lowx, align 4, !tbaa !7
  store float %2, float addrspace(3)* @_ZZ10montecarloPfffffiE5highx, align 4, !tbaa !7
  store float %3, float addrspace(3)* @_ZZ10montecarloPfffffiE4lowy, align 4, !tbaa !7
  store float %4, float addrspace(3)* @_ZZ10montecarloPfffffiE5highy, align 4, !tbaa !7
  store i32 %5, i32 addrspace(3)* @_ZZ10montecarloPfffffiE5iters, align 4, !tbaa !11
  br label %18

18:                                               ; preds = %17, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = xor i32 %15, 746559103
  %20 = icmp sgt i32 %15, -1
  %21 = mul i32 %19, 1228688033
  %22 = select i1 %20, i32 -1973591729, i32 -100066652
  %23 = load i32, i32 addrspace(3)* @_ZZ10montecarloPfffffiE5iters, align 4, !tbaa !11
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %97

25:                                               ; preds = %18
  %26 = add i32 %21, 6615241
  %27 = add i32 %26, %22
  %28 = add i32 %21, 5783321
  %29 = xor i32 %22, 88675123
  %30 = add nsw i32 %22, 521288629
  %31 = xor i32 %21, 362436069
  %32 = add i32 %21, 123456789
  %33 = load float, float addrspace(3)* @_ZZ10montecarloPfffffiE4lowx, align 4, !tbaa !7
  %34 = load float, float addrspace(3)* @_ZZ10montecarloPfffffiE5highx, align 4, !tbaa !7
  %35 = fsub contract float %34, %33
  %36 = load float, float addrspace(3)* @_ZZ10montecarloPfffffiE4lowy, align 4, !tbaa !7
  %37 = load float, float addrspace(3)* @_ZZ10montecarloPfffffiE5highy, align 4, !tbaa !7
  %38 = fsub contract float %37, %36
  br label %39

39:                                               ; preds = %25, %39
  %40 = phi float [ 0.000000e+00, %25 ], [ %94, %39 ]
  %41 = phi i32 [ 0, %25 ], [ %95, %39 ]
  %42 = phi i32 [ %27, %25 ], [ %69, %39 ]
  %43 = phi i32 [ %28, %25 ], [ %68, %39 ]
  %44 = phi i32 [ %29, %25 ], [ %54, %39 ]
  %45 = phi i32 [ %30, %25 ], [ %43, %39 ]
  %46 = phi i32 [ %32, %25 ], [ %45, %39 ]
  %47 = phi i32 [ %31, %25 ], [ %44, %39 ]
  %48 = lshr i32 %46, 2
  %49 = xor i32 %48, %46
  %50 = shl i32 %43, 4
  %51 = shl i32 %49, 1
  %52 = xor i32 %51, %50
  %53 = xor i32 %52, %49
  %54 = xor i32 %53, %43
  %55 = add i32 %42, 362437
  %56 = add i32 %55, %54
  %57 = uitofp i32 %56 to float
  %58 = fmul contract float %57, 0x3DF0000000000000
  %59 = fadd contract float %58, 0x3DF0000000000000
  %60 = fmul contract float %59, %35
  %61 = fadd contract float %33, %60
  %62 = lshr i32 %47, 2
  %63 = xor i32 %62, %47
  %64 = shl i32 %54, 4
  %65 = shl i32 %63, 1
  %66 = xor i32 %65, %64
  %67 = xor i32 %66, %63
  %68 = xor i32 %67, %54
  %69 = add i32 %42, 724874
  %70 = add i32 %68, %69
  %71 = uitofp i32 %70 to float
  %72 = fmul contract float %71, 0x3DF0000000000000
  %73 = fadd contract float %72, 0x3DF0000000000000
  %74 = fmul contract float %73, %38
  %75 = fadd contract float %36, %74
  %76 = fneg contract float %61
  %77 = fmul contract float %61, %76
  %78 = fmul contract float %75, %75
  %79 = fsub contract float %77, %78
  %80 = fmul float %79, 0x3FF7154760000000
  %81 = tail call float @llvm.rint.f32(float %80)
  %82 = fcmp ogt float %79, 0x40562E4300000000
  %83 = fcmp olt float %79, 0xC059D1DA00000000
  %84 = fneg float %80
  %85 = tail call float @llvm.fma.f32(float %79, float 0x3FF7154760000000, float %84)
  %86 = tail call float @llvm.fma.f32(float %79, float 0x3E54AE0BE0000000, float %85)
  %87 = fsub float %80, %81
  %88 = fadd float %86, %87
  %89 = tail call float @llvm.exp2.f32(float %88)
  %90 = fptosi float %81 to i32
  %91 = tail call float @llvm.amdgcn.ldexp.f32(float %89, i32 %90)
  %92 = select i1 %83, float 0.000000e+00, float %91
  %93 = select i1 %82, float 0x7FF0000000000000, float %92
  %94 = fadd contract float %40, %93
  %95 = add nuw nsw i32 %41, 1
  %96 = icmp eq i32 %95, %23
  br i1 %96, label %97, label %39, !llvm.loop !13

97:                                               ; preds = %39, %18
  %98 = phi float [ 0.000000e+00, %18 ], [ %94, %39 ]
  %99 = sext i32 %15 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  store float %98, float addrspace(1)* %100, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
