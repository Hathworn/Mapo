; ModuleID = '../data/hip_kernels/18137/0/main.cu'
source_filename = "../data/hip_kernels/18137/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19softmax_loss_kernelPfS_S_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp sgt i32 %5, 0
  br i1 %16, label %17, label %50

17:                                               ; preds = %6
  %18 = mul nsw i32 %15, %5
  %19 = and i32 %5, 1
  %20 = icmp eq i32 %5, 1
  br i1 %20, label %23, label %21

21:                                               ; preds = %17
  %22 = and i32 %5, -2
  br label %56

23:                                               ; preds = %56, %17
  %24 = phi float [ undef, %17 ], [ %102, %56 ]
  %25 = phi i32 [ 0, %17 ], [ %103, %56 ]
  %26 = phi float [ 0.000000e+00, %17 ], [ %102, %56 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %50, label %28

28:                                               ; preds = %23
  %29 = add nsw i32 %25, %18
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 144)
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %34, %36
  %38 = tail call float @llvm.log2.f32(float %37)
  %39 = fmul float %38, 0x3FE62E42E0000000
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 519)
  %41 = fneg float %39
  %42 = tail call float @llvm.fma.f32(float %38, float 0x3FE62E42E0000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %38, float 0x3E6EFA39E0000000, float %42)
  %44 = fadd float %39, %43
  %45 = select i1 %40, float %38, float %44
  %46 = select i1 %35, float 0x40362E4300000000, float 0.000000e+00
  %47 = fsub float %45, %46
  %48 = fmul contract float %32, %47
  %49 = fadd contract float %26, %48
  br label %50

50:                                               ; preds = %28, %23, %6
  %51 = phi float [ 0.000000e+00, %6 ], [ %24, %23 ], [ %49, %28 ]
  %52 = fneg contract float %51
  %53 = sext i32 %15 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  store float %52, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = icmp eq i32 %12, 0
  br i1 %55, label %106, label %138

56:                                               ; preds = %56, %21
  %57 = phi i32 [ 0, %21 ], [ %103, %56 ]
  %58 = phi float [ 0.000000e+00, %21 ], [ %102, %56 ]
  %59 = phi i32 [ 0, %21 ], [ %104, %56 ]
  %60 = add nsw i32 %57, %18
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 144)
  %67 = select i1 %66, float 0x41F0000000000000, float 1.000000e+00
  %68 = fmul float %65, %67
  %69 = tail call float @llvm.log2.f32(float %68)
  %70 = fmul float %69, 0x3FE62E42E0000000
  %71 = tail call i1 @llvm.amdgcn.class.f32(float %69, i32 519)
  %72 = fneg float %70
  %73 = tail call float @llvm.fma.f32(float %69, float 0x3FE62E42E0000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %69, float 0x3E6EFA39E0000000, float %73)
  %75 = fadd float %70, %74
  %76 = select i1 %71, float %69, float %75
  %77 = select i1 %66, float 0x40362E4300000000, float 0.000000e+00
  %78 = fsub float %76, %77
  %79 = fmul contract float %63, %78
  %80 = fadd contract float %58, %79
  %81 = or i32 %57, 1
  %82 = add nsw i32 %81, %18
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = tail call i1 @llvm.amdgcn.class.f32(float %87, i32 144)
  %89 = select i1 %88, float 0x41F0000000000000, float 1.000000e+00
  %90 = fmul float %87, %89
  %91 = tail call float @llvm.log2.f32(float %90)
  %92 = fmul float %91, 0x3FE62E42E0000000
  %93 = tail call i1 @llvm.amdgcn.class.f32(float %91, i32 519)
  %94 = fneg float %92
  %95 = tail call float @llvm.fma.f32(float %91, float 0x3FE62E42E0000000, float %94)
  %96 = tail call float @llvm.fma.f32(float %91, float 0x3E6EFA39E0000000, float %95)
  %97 = fadd float %92, %96
  %98 = select i1 %93, float %91, float %97
  %99 = select i1 %88, float 0x40362E4300000000, float 0.000000e+00
  %100 = fsub float %98, %99
  %101 = fmul contract float %85, %100
  %102 = fadd contract float %80, %101
  %103 = add nuw nsw i32 %57, 2
  %104 = add i32 %59, 2
  %105 = icmp eq i32 %104, %22
  br i1 %105, label %23, label %56, !llvm.loop !11

106:                                              ; preds = %50
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %14
  store float 0.000000e+00, float addrspace(3)* %107, align 4, !tbaa !7
  %108 = icmp sgt i32 %4, 0
  br i1 %108, label %112, label %110

109:                                              ; preds = %112
  store float %119, float addrspace(3)* %107, align 4, !tbaa !7
  br label %110

110:                                              ; preds = %109, %106
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %111 = icmp ult i16 %10, 2
  br i1 %111, label %122, label %124

112:                                              ; preds = %106, %112
  %113 = phi float [ %119, %112 ], [ 0.000000e+00, %106 ]
  %114 = phi i32 [ %120, %112 ], [ 0, %106 ]
  %115 = add i32 %114, %14
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %3, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = fadd contract float %118, %113
  %120 = add i32 %114, %11
  %121 = icmp slt i32 %120, %4
  br i1 %121, label %112, label %109, !llvm.loop !13

122:                                              ; preds = %134, %110
  %123 = icmp eq i32 %14, 0
  br i1 %123, label %136, label %138

124:                                              ; preds = %110, %134
  %125 = phi i32 [ %126, %134 ], [ %11, %110 ]
  %126 = lshr i32 %125, 1
  %127 = add nuw nsw i32 %126, %14
  %128 = icmp ult i32 %127, %4
  br i1 %128, label %129, label %134

129:                                              ; preds = %124
  %130 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %127
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !7
  %132 = load float, float addrspace(3)* %107, align 4, !tbaa !7
  %133 = fadd contract float %131, %132
  store float %133, float addrspace(3)* %107, align 4, !tbaa !7
  br label %134

134:                                              ; preds = %129, %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %135 = icmp ult i32 %125, 4
  br i1 %135, label %122, label %124, !llvm.loop !14

136:                                              ; preds = %122
  %137 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 0), align 4, !tbaa !7
  store float %137, float addrspace(1)* %0, align 4, !tbaa !7
  br label %138

138:                                              ; preds = %122, %136, %50
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
