; ModuleID = '../data/hip_kernels/5182/275/main.cu'
source_filename = "../data/hip_kernels/5182/275/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8NN_naivePfiiS_iiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = udiv i32 %17, %14
  %21 = mul i32 %20, %14
  %22 = icmp ugt i32 %17, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %18
  %28 = mul i32 %27, %14
  %29 = add i32 %28, %26
  %30 = mul nsw i32 %5, %4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %43

32:                                               ; preds = %9
  %33 = mul nsw i32 %29, %1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = icmp sgt i32 %6, 0
  %37 = and i32 %6, 7
  %38 = icmp ult i32 %6, 8
  %39 = and i32 %6, -8
  %40 = icmp eq i32 %37, 0
  br label %49

41:                                               ; preds = %154
  %42 = sitofp i32 %178 to float
  br label %43

43:                                               ; preds = %41, %9
  %44 = phi float [ -1.000000e+00, %9 ], [ %42, %41 ]
  %45 = phi float [ 9.999900e+04, %9 ], [ %179, %41 ]
  %46 = sext i32 %29 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %8, i64 %46
  store float %45, float addrspace(1)* %47, align 4, !tbaa !16
  %48 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  store float %44, float addrspace(1)* %48, align 4, !tbaa !16
  ret void

49:                                               ; preds = %32, %154
  %50 = phi float [ 9.999900e+04, %32 ], [ %179, %154 ]
  %51 = phi i32 [ 0, %32 ], [ %180, %154 ]
  %52 = phi i32 [ -1, %32 ], [ %178, %154 ]
  %53 = mul nsw i32 %51, %4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  br i1 %36, label %56, label %154

56:                                               ; preds = %49
  br i1 %38, label %135, label %57

57:                                               ; preds = %56, %57
  %58 = phi i32 [ %132, %57 ], [ 0, %56 ]
  %59 = phi float [ %131, %57 ], [ 0.000000e+00, %56 ]
  %60 = phi i32 [ %133, %57 ], [ 0, %56 ]
  %61 = zext i32 %58 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %35, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !5
  %64 = getelementptr inbounds float, float addrspace(1)* %55, i64 %61
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !5
  %66 = fsub contract float %63, %65
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %59, %67
  %69 = or i32 %58, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %35, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !5
  %73 = getelementptr inbounds float, float addrspace(1)* %55, i64 %70
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16, !amdgpu.noclobber !5
  %75 = fsub contract float %72, %74
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %68, %76
  %78 = or i32 %58, 2
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %35, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !5
  %82 = getelementptr inbounds float, float addrspace(1)* %55, i64 %79
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !5
  %84 = fsub contract float %81, %83
  %85 = fmul contract float %84, %84
  %86 = fadd contract float %77, %85
  %87 = or i32 %58, 3
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %35, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !5
  %91 = getelementptr inbounds float, float addrspace(1)* %55, i64 %88
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = fsub contract float %90, %92
  %94 = fmul contract float %93, %93
  %95 = fadd contract float %86, %94
  %96 = or i32 %58, 4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %35, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !5
  %100 = getelementptr inbounds float, float addrspace(1)* %55, i64 %97
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16, !amdgpu.noclobber !5
  %102 = fsub contract float %99, %101
  %103 = fmul contract float %102, %102
  %104 = fadd contract float %95, %103
  %105 = or i32 %58, 5
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %35, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16, !amdgpu.noclobber !5
  %109 = getelementptr inbounds float, float addrspace(1)* %55, i64 %106
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !5
  %111 = fsub contract float %108, %110
  %112 = fmul contract float %111, %111
  %113 = fadd contract float %104, %112
  %114 = or i32 %58, 6
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %35, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !5
  %118 = getelementptr inbounds float, float addrspace(1)* %55, i64 %115
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !5
  %120 = fsub contract float %117, %119
  %121 = fmul contract float %120, %120
  %122 = fadd contract float %113, %121
  %123 = or i32 %58, 7
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %35, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !5
  %127 = getelementptr inbounds float, float addrspace(1)* %55, i64 %124
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16, !amdgpu.noclobber !5
  %129 = fsub contract float %126, %128
  %130 = fmul contract float %129, %129
  %131 = fadd contract float %122, %130
  %132 = add nuw nsw i32 %58, 8
  %133 = add i32 %60, 8
  %134 = icmp eq i32 %133, %39
  br i1 %134, label %135, label %57, !llvm.loop !20

135:                                              ; preds = %57, %56
  %136 = phi float [ undef, %56 ], [ %131, %57 ]
  %137 = phi i32 [ 0, %56 ], [ %132, %57 ]
  %138 = phi float [ 0.000000e+00, %56 ], [ %131, %57 ]
  br i1 %40, label %154, label %139

139:                                              ; preds = %135, %139
  %140 = phi i32 [ %151, %139 ], [ %137, %135 ]
  %141 = phi float [ %150, %139 ], [ %138, %135 ]
  %142 = phi i32 [ %152, %139 ], [ 0, %135 ]
  %143 = zext i32 %140 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %35, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16, !amdgpu.noclobber !5
  %146 = getelementptr inbounds float, float addrspace(1)* %55, i64 %143
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16, !amdgpu.noclobber !5
  %148 = fsub contract float %145, %147
  %149 = fmul contract float %148, %148
  %150 = fadd contract float %141, %149
  %151 = add nuw nsw i32 %140, 1
  %152 = add i32 %142, 1
  %153 = icmp eq i32 %152, %37
  br i1 %153, label %154, label %139, !llvm.loop !22

154:                                              ; preds = %135, %139, %49
  %155 = phi float [ 0.000000e+00, %49 ], [ %136, %135 ], [ %150, %139 ]
  %156 = fcmp olt float %155, 0x39F0000000000000
  %157 = select i1 %156, float 0x41F0000000000000, float 1.000000e+00
  %158 = fmul float %155, %157
  %159 = tail call float @llvm.sqrt.f32(float %158)
  %160 = bitcast float %159 to i32
  %161 = add nsw i32 %160, -1
  %162 = bitcast i32 %161 to float
  %163 = add nsw i32 %160, 1
  %164 = bitcast i32 %163 to float
  %165 = tail call i1 @llvm.amdgcn.class.f32(float %158, i32 608)
  %166 = select i1 %156, float 0x3EF0000000000000, float 1.000000e+00
  %167 = fneg float %164
  %168 = tail call float @llvm.fma.f32(float %167, float %159, float %158)
  %169 = fcmp ogt float %168, 0.000000e+00
  %170 = fneg float %162
  %171 = tail call float @llvm.fma.f32(float %170, float %159, float %158)
  %172 = fcmp ole float %171, 0.000000e+00
  %173 = select i1 %172, float %162, float %159
  %174 = select i1 %169, float %164, float %173
  %175 = fmul float %166, %174
  %176 = select i1 %165, float %158, float %175
  %177 = fcmp contract ogt float %50, %176
  %178 = select i1 %177, i32 %51, i32 %52
  %179 = select i1 %177, float %176, float %50
  %180 = add nsw i32 %51, %4
  %181 = icmp slt i32 %180, %30
  br i1 %181, label %49, label %41, !llvm.loop !24
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
