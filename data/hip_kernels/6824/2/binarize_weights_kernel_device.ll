; ModuleID = '../data/hip_kernels/6824/2/main.cu'
source_filename = "../data/hip_kernels/6824/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23binarize_weights_kernelPfiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
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
  %22 = mul i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %1
  br i1 %25, label %26, label %210

26:                                               ; preds = %4
  %27 = icmp sgt i32 %2, 0
  br i1 %27, label %28, label %114

28:                                               ; preds = %26
  %29 = mul nsw i32 %24, %2
  %30 = and i32 %2, 7
  %31 = icmp ult i32 %2, 8
  br i1 %31, label %96, label %32

32:                                               ; preds = %28
  %33 = and i32 %2, -8
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi float [ 0.000000e+00, %32 ], [ %92, %34 ]
  %36 = phi i32 [ 0, %32 ], [ %93, %34 ]
  %37 = phi i32 [ 0, %32 ], [ %94, %34 ]
  %38 = add nsw i32 %36, %29
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !14
  %42 = tail call float @llvm.fabs.f32(float %41)
  %43 = fadd contract float %35, %42
  %44 = or i32 %36, 1
  %45 = add nsw i32 %44, %29
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !14
  %49 = tail call float @llvm.fabs.f32(float %48)
  %50 = fadd contract float %43, %49
  %51 = or i32 %36, 2
  %52 = add nsw i32 %51, %29
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !14
  %56 = tail call float @llvm.fabs.f32(float %55)
  %57 = fadd contract float %50, %56
  %58 = or i32 %36, 3
  %59 = add nsw i32 %58, %29
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !14
  %63 = tail call float @llvm.fabs.f32(float %62)
  %64 = fadd contract float %57, %63
  %65 = or i32 %36, 4
  %66 = add nsw i32 %65, %29
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !14
  %70 = tail call float @llvm.fabs.f32(float %69)
  %71 = fadd contract float %64, %70
  %72 = or i32 %36, 5
  %73 = add nsw i32 %72, %29
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !14
  %77 = tail call float @llvm.fabs.f32(float %76)
  %78 = fadd contract float %71, %77
  %79 = or i32 %36, 6
  %80 = add nsw i32 %79, %29
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !14
  %84 = tail call float @llvm.fabs.f32(float %83)
  %85 = fadd contract float %78, %84
  %86 = or i32 %36, 7
  %87 = add nsw i32 %86, %29
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !14
  %91 = tail call float @llvm.fabs.f32(float %90)
  %92 = fadd contract float %85, %91
  %93 = add nuw nsw i32 %36, 8
  %94 = add i32 %37, 8
  %95 = icmp eq i32 %94, %33
  br i1 %95, label %96, label %34, !llvm.loop !20

96:                                               ; preds = %34, %28
  %97 = phi float [ undef, %28 ], [ %92, %34 ]
  %98 = phi float [ 0.000000e+00, %28 ], [ %92, %34 ]
  %99 = phi i32 [ 0, %28 ], [ %93, %34 ]
  %100 = icmp eq i32 %30, 0
  br i1 %100, label %114, label %101

101:                                              ; preds = %96, %101
  %102 = phi float [ %110, %101 ], [ %98, %96 ]
  %103 = phi i32 [ %111, %101 ], [ %99, %96 ]
  %104 = phi i32 [ %112, %101 ], [ 0, %96 ]
  %105 = add nsw i32 %103, %29
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16, !amdgpu.noclobber !14
  %109 = tail call float @llvm.fabs.f32(float %108)
  %110 = fadd contract float %102, %109
  %111 = add nuw nsw i32 %103, 1
  %112 = add i32 %104, 1
  %113 = icmp eq i32 %112, %30
  br i1 %113, label %114, label %101, !llvm.loop !22

114:                                              ; preds = %96, %101, %26
  %115 = phi float [ 0.000000e+00, %26 ], [ %97, %96 ], [ %110, %101 ]
  %116 = sitofp i32 %2 to float
  %117 = fdiv contract float %115, %116
  br i1 %27, label %118, label %210

118:                                              ; preds = %114
  %119 = mul nsw i32 %24, %2
  %120 = fneg contract float %117
  %121 = and i32 %2, 7
  %122 = icmp ult i32 %2, 8
  br i1 %122, label %194, label %123

123:                                              ; preds = %118
  %124 = and i32 %2, -8
  br label %125

125:                                              ; preds = %125, %123
  %126 = phi i32 [ 0, %123 ], [ %191, %125 ]
  %127 = phi i32 [ 0, %123 ], [ %192, %125 ]
  %128 = add nsw i32 %126, %119
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %132 = fcmp contract ogt float %131, 0.000000e+00
  %133 = select contract i1 %132, float %117, float %120
  %134 = getelementptr inbounds float, float addrspace(1)* %3, i64 %129
  store float %133, float addrspace(1)* %134, align 4, !tbaa !16
  %135 = or i32 %126, 1
  %136 = add nsw i32 %135, %119
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fcmp contract ogt float %139, 0.000000e+00
  %141 = select contract i1 %140, float %117, float %120
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %137
  store float %141, float addrspace(1)* %142, align 4, !tbaa !16
  %143 = or i32 %126, 2
  %144 = add nsw i32 %143, %119
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16
  %148 = fcmp contract ogt float %147, 0.000000e+00
  %149 = select contract i1 %148, float %117, float %120
  %150 = getelementptr inbounds float, float addrspace(1)* %3, i64 %145
  store float %149, float addrspace(1)* %150, align 4, !tbaa !16
  %151 = or i32 %126, 3
  %152 = add nsw i32 %151, %119
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16
  %156 = fcmp contract ogt float %155, 0.000000e+00
  %157 = select contract i1 %156, float %117, float %120
  %158 = getelementptr inbounds float, float addrspace(1)* %3, i64 %153
  store float %157, float addrspace(1)* %158, align 4, !tbaa !16
  %159 = or i32 %126, 4
  %160 = add nsw i32 %159, %119
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = fcmp contract ogt float %163, 0.000000e+00
  %165 = select contract i1 %164, float %117, float %120
  %166 = getelementptr inbounds float, float addrspace(1)* %3, i64 %161
  store float %165, float addrspace(1)* %166, align 4, !tbaa !16
  %167 = or i32 %126, 5
  %168 = add nsw i32 %167, %119
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !16
  %172 = fcmp contract ogt float %171, 0.000000e+00
  %173 = select contract i1 %172, float %117, float %120
  %174 = getelementptr inbounds float, float addrspace(1)* %3, i64 %169
  store float %173, float addrspace(1)* %174, align 4, !tbaa !16
  %175 = or i32 %126, 6
  %176 = add nsw i32 %175, %119
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !16
  %180 = fcmp contract ogt float %179, 0.000000e+00
  %181 = select contract i1 %180, float %117, float %120
  %182 = getelementptr inbounds float, float addrspace(1)* %3, i64 %177
  store float %181, float addrspace(1)* %182, align 4, !tbaa !16
  %183 = or i32 %126, 7
  %184 = add nsw i32 %183, %119
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !16
  %188 = fcmp contract ogt float %187, 0.000000e+00
  %189 = select contract i1 %188, float %117, float %120
  %190 = getelementptr inbounds float, float addrspace(1)* %3, i64 %185
  store float %189, float addrspace(1)* %190, align 4, !tbaa !16
  %191 = add nuw nsw i32 %126, 8
  %192 = add i32 %127, 8
  %193 = icmp eq i32 %192, %124
  br i1 %193, label %194, label %125, !llvm.loop !24

194:                                              ; preds = %125, %118
  %195 = phi i32 [ 0, %118 ], [ %191, %125 ]
  %196 = icmp eq i32 %121, 0
  br i1 %196, label %210, label %197

197:                                              ; preds = %194, %197
  %198 = phi i32 [ %207, %197 ], [ %195, %194 ]
  %199 = phi i32 [ %208, %197 ], [ 0, %194 ]
  %200 = add nsw i32 %198, %119
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !16
  %204 = fcmp contract ogt float %203, 0.000000e+00
  %205 = select contract i1 %204, float %117, float %120
  %206 = getelementptr inbounds float, float addrspace(1)* %3, i64 %201
  store float %205, float addrspace(1)* %206, align 4, !tbaa !16
  %207 = add nuw nsw i32 %198, 1
  %208 = add i32 %199, 1
  %209 = icmp eq i32 %208, %121
  br i1 %209, label %210, label %197, !llvm.loop !25

210:                                              ; preds = %194, %197, %114, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
