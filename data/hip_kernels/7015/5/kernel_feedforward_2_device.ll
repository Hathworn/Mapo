; ModuleID = '../data/hip_kernels/7015/5/main.cu'
source_filename = "../data/hip_kernels/7015/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sm = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20kernel_feedforward_2iPiS_S_PfS0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %14, %19
  %22 = sext i32 %0 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = add nsw i32 %0, -1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = add nsw i32 %24, -1
  %30 = icmp slt i32 %21, %29
  br i1 %30, label %31, label %174

31:                                               ; preds = %7
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = icmp slt i32 %20, %28
  br i1 %34, label %35, label %39

35:                                               ; preds = %31
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %26
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = add i32 %37, %21
  br label %51

39:                                               ; preds = %51, %31
  %40 = phi float [ 0.000000e+00, %31 ], [ %64, %51 ]
  %41 = mul nuw nsw i32 %20, %13
  %42 = add nuw nsw i32 %41, %19
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %42
  %44 = bitcast i32 addrspace(3)* %43 to float addrspace(3)*
  store float %40, float addrspace(3)* %44, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp eq i32 %20, 0
  br i1 %45, label %46, label %174

46:                                               ; preds = %39
  %47 = and i32 %18, 7
  %48 = icmp ult i16 %17, 8
  br i1 %48, label %67, label %49

49:                                               ; preds = %46
  %50 = and i32 %18, 2040
  br label %112

51:                                               ; preds = %35, %51
  %52 = phi i32 [ %20, %35 ], [ %65, %51 ]
  %53 = phi float [ 0.000000e+00, %35 ], [ %64, %51 ]
  %54 = mul nsw i32 %52, %29
  %55 = add i32 %38, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11, !amdgpu.noclobber !5
  %59 = add nsw i32 %52, %33
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %5, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11, !amdgpu.noclobber !5
  %63 = fmul contract float %58, %62
  %64 = fadd contract float %53, %63
  %65 = add nuw nsw i32 %52, %18
  %66 = icmp slt i32 %65, %28
  br i1 %66, label %51, label %39, !llvm.loop !13

67:                                               ; preds = %112, %46
  %68 = phi float [ undef, %46 ], [ %170, %112 ]
  %69 = phi i32 [ 0, %46 ], [ %171, %112 ]
  %70 = phi float [ 0.000000e+00, %46 ], [ %170, %112 ]
  %71 = icmp eq i32 %47, 0
  br i1 %71, label %85, label %72

72:                                               ; preds = %67, %72
  %73 = phi i32 [ %82, %72 ], [ %69, %67 ]
  %74 = phi float [ %81, %72 ], [ %70, %67 ]
  %75 = phi i32 [ %83, %72 ], [ 0, %67 ]
  %76 = mul nuw nsw i32 %73, %13
  %77 = add nuw nsw i32 %76, %19
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %77
  %79 = bitcast i32 addrspace(3)* %78 to float addrspace(3)*
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !11
  %81 = fadd contract float %74, %80
  %82 = add nuw nsw i32 %73, 1
  %83 = add i32 %75, 1
  %84 = icmp eq i32 %83, %47
  br i1 %84, label %85, label %72, !llvm.loop !15

85:                                               ; preds = %72, %67
  %86 = phi float [ %68, %67 ], [ %81, %72 ]
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = add nsw i32 %88, %21
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %90
  store float %86, float addrspace(1)* %91, align 4, !tbaa !11
  %92 = fneg contract float %86
  %93 = fmul float %86, 0xBFF7154760000000
  %94 = tail call float @llvm.rint.f32(float %93)
  %95 = fcmp olt float %86, 0xC0562E4300000000
  %96 = fcmp ogt float %86, 0x4059D1DA00000000
  %97 = fneg float %93
  %98 = tail call float @llvm.fma.f32(float %92, float 0x3FF7154760000000, float %97)
  %99 = tail call float @llvm.fma.f32(float %92, float 0x3E54AE0BE0000000, float %98)
  %100 = fsub float %93, %94
  %101 = fadd float %99, %100
  %102 = tail call float @llvm.exp2.f32(float %101)
  %103 = fptosi float %94 to i32
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 %103)
  %105 = select i1 %96, float 0.000000e+00, float %104
  %106 = select i1 %95, float 0x7FF0000000000000, float %105
  %107 = fpext float %106 to double
  %108 = fadd contract double %107, 1.000000e+00
  %109 = fdiv contract double 1.000000e+00, %108
  %110 = fptrunc double %109 to float
  %111 = getelementptr inbounds float, float addrspace(1)* %5, i64 %90
  store float %110, float addrspace(1)* %111, align 4, !tbaa !11
  br label %174

112:                                              ; preds = %112, %49
  %113 = phi i32 [ 0, %49 ], [ %171, %112 ]
  %114 = phi float [ 0.000000e+00, %49 ], [ %170, %112 ]
  %115 = phi i32 [ 0, %49 ], [ %172, %112 ]
  %116 = mul nuw nsw i32 %113, %13
  %117 = add nuw nsw i32 %116, %19
  %118 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %117
  %119 = bitcast i32 addrspace(3)* %118 to float addrspace(3)*
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !11
  %121 = fadd contract float %114, %120
  %122 = or i32 %113, 1
  %123 = mul nuw nsw i32 %122, %13
  %124 = add nuw nsw i32 %123, %19
  %125 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %124
  %126 = bitcast i32 addrspace(3)* %125 to float addrspace(3)*
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !11
  %128 = fadd contract float %121, %127
  %129 = or i32 %113, 2
  %130 = mul nuw nsw i32 %129, %13
  %131 = add nuw nsw i32 %130, %19
  %132 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %131
  %133 = bitcast i32 addrspace(3)* %132 to float addrspace(3)*
  %134 = load float, float addrspace(3)* %133, align 4, !tbaa !11
  %135 = fadd contract float %128, %134
  %136 = or i32 %113, 3
  %137 = mul nuw nsw i32 %136, %13
  %138 = add nuw nsw i32 %137, %19
  %139 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %138
  %140 = bitcast i32 addrspace(3)* %139 to float addrspace(3)*
  %141 = load float, float addrspace(3)* %140, align 4, !tbaa !11
  %142 = fadd contract float %135, %141
  %143 = or i32 %113, 4
  %144 = mul nuw nsw i32 %143, %13
  %145 = add nuw nsw i32 %144, %19
  %146 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %145
  %147 = bitcast i32 addrspace(3)* %146 to float addrspace(3)*
  %148 = load float, float addrspace(3)* %147, align 4, !tbaa !11
  %149 = fadd contract float %142, %148
  %150 = or i32 %113, 5
  %151 = mul nuw nsw i32 %150, %13
  %152 = add nuw nsw i32 %151, %19
  %153 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %152
  %154 = bitcast i32 addrspace(3)* %153 to float addrspace(3)*
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !11
  %156 = fadd contract float %149, %155
  %157 = or i32 %113, 6
  %158 = mul nuw nsw i32 %157, %13
  %159 = add nuw nsw i32 %158, %19
  %160 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %159
  %161 = bitcast i32 addrspace(3)* %160 to float addrspace(3)*
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !11
  %163 = fadd contract float %156, %162
  %164 = or i32 %113, 7
  %165 = mul nuw nsw i32 %164, %13
  %166 = add nuw nsw i32 %165, %19
  %167 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %166
  %168 = bitcast i32 addrspace(3)* %167 to float addrspace(3)*
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !11
  %170 = fadd contract float %163, %169
  %171 = add nuw nsw i32 %113, 8
  %172 = add i32 %115, 8
  %173 = icmp eq i32 %172, %50
  br i1 %173, label %67, label %112, !llvm.loop !17

174:                                              ; preds = %39, %85, %7
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
declare i32 @llvm.amdgcn.workitem.id.y() #3

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
