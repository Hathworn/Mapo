; ModuleID = '../data/hip_kernels/15505/22/main.cu'
source_filename = "../data/hip_kernels/15505/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17add_normal_kerneliPfiff(i32 %0, float addrspace(1)* nocapture %1, i32 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %115

8:                                                ; preds = %5
  %9 = xor i32 %0, 746559103
  %10 = icmp sgt i32 %0, -1
  %11 = mul i32 %9, 1228688033
  %12 = select i1 %10, i32 -1973591729, i32 -100066652
  %13 = icmp eq i32 %2, 0
  br i1 %13, label %115, label %14

14:                                               ; preds = %8
  %15 = add i32 %11, 6615241
  %16 = add i32 %15, %12
  %17 = add i32 %11, 5783321
  %18 = xor i32 %12, 88675123
  %19 = add nsw i32 %12, 521288629
  %20 = xor i32 %11, 362436069
  %21 = add i32 %11, 123456789
  %22 = sext i32 %2 to i64
  br label %23

23:                                               ; preds = %14, %98
  %24 = phi i64 [ %113, %98 ], [ 0, %14 ]
  %25 = phi i32 [ %106, %98 ], [ %16, %14 ]
  %26 = phi i32 [ %105, %98 ], [ 0, %14 ]
  %27 = phi i32 [ %104, %98 ], [ %17, %14 ]
  %28 = phi float [ %103, %98 ], [ undef, %14 ]
  %29 = phi i32 [ %102, %98 ], [ %18, %14 ]
  %30 = phi i32 [ %101, %98 ], [ %21, %14 ]
  %31 = phi i32 [ %100, %98 ], [ %20, %14 ]
  %32 = phi i32 [ %99, %98 ], [ %19, %14 ]
  %33 = icmp eq i32 %26, 0
  br i1 %33, label %34, label %98

34:                                               ; preds = %23
  %35 = lshr i32 %30, 2
  %36 = xor i32 %35, %30
  %37 = shl i32 %27, 4
  %38 = shl i32 %36, 1
  %39 = xor i32 %38, %37
  %40 = xor i32 %39, %36
  %41 = xor i32 %40, %27
  %42 = add i32 %25, 362437
  %43 = add i32 %42, %41
  %44 = lshr i32 %31, 2
  %45 = xor i32 %44, %31
  %46 = shl i32 %41, 4
  %47 = shl i32 %45, 1
  %48 = xor i32 %47, %46
  %49 = xor i32 %48, %45
  %50 = xor i32 %49, %41
  %51 = add i32 %25, 724874
  %52 = add i32 %50, %51
  %53 = uitofp i32 %43 to float
  %54 = fmul contract float %53, 0x3DF0000000000000
  %55 = fadd contract float %54, 0x3DF0000000000000
  %56 = uitofp i32 %52 to float
  %57 = fmul contract float %56, 0x3E1921FB60000000
  %58 = fadd contract float %57, 0x3E1921FB60000000
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 144)
  %60 = select i1 %59, float 0x41F0000000000000, float 1.000000e+00
  %61 = fmul float %55, %60
  %62 = tail call float @llvm.log2.f32(float %61)
  %63 = fmul float %62, 0x3FE62E42E0000000
  %64 = tail call i1 @llvm.amdgcn.class.f32(float %62, i32 519)
  %65 = fneg float %63
  %66 = tail call float @llvm.fma.f32(float %62, float 0x3FE62E42E0000000, float %65)
  %67 = tail call float @llvm.fma.f32(float %62, float 0x3E6EFA39E0000000, float %66)
  %68 = fadd float %63, %67
  %69 = select i1 %64, float %62, float %68
  %70 = select i1 %59, float 0x40362E4300000000, float 0.000000e+00
  %71 = fsub float %69, %70
  %72 = fmul contract float %71, -2.000000e+00
  %73 = fcmp olt float %72, 0x39F0000000000000
  %74 = select i1 %73, float 0x41F0000000000000, float 1.000000e+00
  %75 = fmul float %72, %74
  %76 = tail call float @llvm.sqrt.f32(float %75)
  %77 = bitcast float %76 to i32
  %78 = add nsw i32 %77, -1
  %79 = bitcast i32 %78 to float
  %80 = add nsw i32 %77, 1
  %81 = bitcast i32 %80 to float
  %82 = tail call i1 @llvm.amdgcn.class.f32(float %75, i32 608)
  %83 = select i1 %73, float 0x3EF0000000000000, float 1.000000e+00
  %84 = fneg float %81
  %85 = tail call float @llvm.fma.f32(float %84, float %76, float %75)
  %86 = fcmp ogt float %85, 0.000000e+00
  %87 = fneg float %79
  %88 = tail call float @llvm.fma.f32(float %87, float %76, float %75)
  %89 = fcmp ole float %88, 0.000000e+00
  %90 = select i1 %89, float %79, float %76
  %91 = select i1 %86, float %81, float %90
  %92 = fmul float %83, %91
  %93 = select i1 %82, float %75, float %92
  %94 = tail call float @llvm.sin.f32(float %58)
  %95 = tail call float @llvm.cos.f32(float %58)
  %96 = fmul contract float %94, %93
  %97 = fmul contract float %95, %93
  br label %98

98:                                               ; preds = %23, %34
  %99 = phi i32 [ %27, %34 ], [ %32, %23 ]
  %100 = phi i32 [ %29, %34 ], [ %31, %23 ]
  %101 = phi i32 [ %32, %34 ], [ %30, %23 ]
  %102 = phi i32 [ %41, %34 ], [ %29, %23 ]
  %103 = phi float [ %97, %34 ], [ %28, %23 ]
  %104 = phi i32 [ %50, %34 ], [ %27, %23 ]
  %105 = phi i32 [ 1, %34 ], [ 0, %23 ]
  %106 = phi i32 [ %51, %34 ], [ %25, %23 ]
  %107 = phi float [ %96, %34 ], [ %28, %23 ]
  %108 = fmul contract float %107, %4
  %109 = fadd contract float %108, %3
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5
  %112 = fadd contract float %111, %109
  store float %112, float addrspace(1)* %110, align 4, !tbaa !5
  %113 = add nuw i64 %24, 1
  %114 = icmp eq i64 %113, %22
  br i1 %114, label %115, label %23, !llvm.loop !9

115:                                              ; preds = %98, %8, %5
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
declare float @llvm.cos.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
