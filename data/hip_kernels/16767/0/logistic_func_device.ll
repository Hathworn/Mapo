; ModuleID = '../data/hip_kernels/16767/0/main.cu'
source_filename = "../data/hip_kernels/16767/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@features = protected addrspace(4) externally_initialized global i32 26, align 4
@num_rows = protected local_unnamed_addr addrspace(4) externally_initialized global i32 16896, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @features to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13logistic_funcPfS_S_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = load i32, i32 addrspace(4)* @features, align 4, !tbaa !7
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %42

15:                                               ; preds = %3
  %16 = mul nsw i32 %13, %12
  %17 = and i32 %13, 7
  %18 = icmp ult i32 %13, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %15
  %20 = and i32 %13, -8
  br label %65

21:                                               ; preds = %65, %15
  %22 = phi float [ undef, %15 ], [ %147, %65 ]
  %23 = phi float [ 0.000000e+00, %15 ], [ %147, %65 ]
  %24 = phi i32 [ 0, %15 ], [ %148, %65 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %42, label %26

26:                                               ; preds = %21, %26
  %27 = phi float [ %38, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %39, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %40, %26 ], [ 0, %21 ]
  %30 = add nsw i32 %16, %28
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !11, !amdgpu.noclobber !5
  %34 = zext i32 %28 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11, !amdgpu.noclobber !5
  %37 = fmul contract float %33, %36
  %38 = fadd contract float %27, %37
  %39 = add nuw nsw i32 %28, 1
  %40 = add i32 %29, 1
  %41 = icmp eq i32 %40, %17
  br i1 %41, label %42, label %26, !llvm.loop !13

42:                                               ; preds = %21, %26, %3
  %43 = phi float [ 0.000000e+00, %3 ], [ %22, %21 ], [ %38, %26 ]
  %44 = fneg contract float %43
  %45 = fmul float %43, 0xBFF7154760000000
  %46 = tail call float @llvm.rint.f32(float %45)
  %47 = fcmp olt float %43, 0xC0562E4300000000
  %48 = fcmp ogt float %43, 0x4059D1DA00000000
  %49 = fneg float %45
  %50 = tail call float @llvm.fma.f32(float %44, float 0x3FF7154760000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %44, float 0x3E54AE0BE0000000, float %50)
  %52 = fsub float %45, %46
  %53 = fadd float %51, %52
  %54 = tail call float @llvm.exp2.f32(float %53)
  %55 = fptosi float %46 to i32
  %56 = tail call float @llvm.amdgcn.ldexp.f32(float %54, i32 %55)
  %57 = select i1 %48, float 0.000000e+00, float %56
  %58 = select i1 %47, float 0x7FF0000000000000, float %57
  %59 = fpext float %58 to double
  %60 = fadd contract double %59, 1.000000e+00
  %61 = fdiv contract double 1.000000e+00, %60
  %62 = fptrunc double %61 to float
  %63 = sext i32 %12 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  store float %62, float addrspace(1)* %64, align 4, !tbaa !11
  ret void

65:                                               ; preds = %65, %19
  %66 = phi float [ 0.000000e+00, %19 ], [ %147, %65 ]
  %67 = phi i32 [ 0, %19 ], [ %148, %65 ]
  %68 = phi i32 [ 0, %19 ], [ %149, %65 ]
  %69 = add nsw i32 %16, %67
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11, !amdgpu.noclobber !5
  %73 = zext i32 %67 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11, !amdgpu.noclobber !5
  %76 = fmul contract float %72, %75
  %77 = fadd contract float %66, %76
  %78 = or i32 %67, 1
  %79 = add nsw i32 %16, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11, !amdgpu.noclobber !5
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !5
  %86 = fmul contract float %82, %85
  %87 = fadd contract float %77, %86
  %88 = or i32 %67, 2
  %89 = add nsw i32 %16, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11, !amdgpu.noclobber !5
  %93 = zext i32 %88 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !11, !amdgpu.noclobber !5
  %96 = fmul contract float %92, %95
  %97 = fadd contract float %87, %96
  %98 = or i32 %67, 3
  %99 = add nsw i32 %16, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !11, !amdgpu.noclobber !5
  %103 = zext i32 %98 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11, !amdgpu.noclobber !5
  %106 = fmul contract float %102, %105
  %107 = fadd contract float %97, %106
  %108 = or i32 %67, 4
  %109 = add nsw i32 %16, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11, !amdgpu.noclobber !5
  %113 = zext i32 %108 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11, !amdgpu.noclobber !5
  %116 = fmul contract float %112, %115
  %117 = fadd contract float %107, %116
  %118 = or i32 %67, 5
  %119 = add nsw i32 %16, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !11, !amdgpu.noclobber !5
  %123 = zext i32 %118 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !5
  %126 = fmul contract float %122, %125
  %127 = fadd contract float %117, %126
  %128 = or i32 %67, 6
  %129 = add nsw i32 %16, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !11, !amdgpu.noclobber !5
  %133 = zext i32 %128 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !11, !amdgpu.noclobber !5
  %136 = fmul contract float %132, %135
  %137 = fadd contract float %127, %136
  %138 = or i32 %67, 7
  %139 = add nsw i32 %16, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !11, !amdgpu.noclobber !5
  %143 = zext i32 %138 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11, !amdgpu.noclobber !5
  %146 = fmul contract float %142, %145
  %147 = fadd contract float %137, %146
  %148 = add nuw nsw i32 %67, 8
  %149 = add i32 %68, 8
  %150 = icmp eq i32 %149, %20
  br i1 %150, label %21, label %65, !llvm.loop !15
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
