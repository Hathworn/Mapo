; ModuleID = '../data/hip_kernels/501/19/main.cu'
source_filename = "../data/hip_kernels/501/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10gpuKendallPKfmS0_mmPdE10threadSums = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10gpuKendallPKfmS0_mmPd(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = zext i32 %9 to i64
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = mul i64 %12, %4
  %16 = mul i64 %14, %4
  %17 = icmp ult i64 %8, %4
  br i1 %17, label %18, label %77

18:                                               ; preds = %6
  %19 = add nuw nsw i64 %10, 1
  br label %20

20:                                               ; preds = %18, %73
  %21 = phi i64 [ %8, %18 ], [ %75, %73 ]
  %22 = phi float [ 0.000000e+00, %18 ], [ %74, %73 ]
  %23 = add i64 %19, %21
  %24 = icmp ult i64 %23, %4
  br i1 %24, label %25, label %73

25:                                               ; preds = %20
  %26 = add i64 %21, %15
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = add i64 %21, %16
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  br label %31

31:                                               ; preds = %25, %65
  %32 = phi i64 [ %23, %25 ], [ %71, %65 ]
  %33 = phi float [ %22, %25 ], [ %70, %65 ]
  %34 = add i64 %32, %15
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = fcmp contract ogt float %36, %28
  br i1 %37, label %38, label %44

38:                                               ; preds = %31
  %39 = add i64 %32, %16
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = fcmp contract ogt float %41, %42
  br label %44

44:                                               ; preds = %38, %31
  %45 = phi i1 [ false, %31 ], [ %43, %38 ]
  %46 = zext i1 %45 to i64
  %47 = fcmp contract olt float %36, %28
  br i1 %47, label %48, label %54

48:                                               ; preds = %44
  %49 = add i64 %32, %16
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fcmp contract olt float %51, %52
  br label %54

54:                                               ; preds = %48, %44
  %55 = phi i1 [ false, %44 ], [ %53, %48 ]
  %56 = zext i1 %55 to i64
  %57 = add nuw nsw i64 %56, %46
  %58 = fcmp contract oeq float %36, %28
  br i1 %58, label %59, label %65

59:                                               ; preds = %54
  %60 = add i64 %32, %16
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fcmp contract oeq float %62, %63
  br label %65

65:                                               ; preds = %59, %54
  %66 = phi i1 [ false, %54 ], [ %64, %59 ]
  %67 = zext i1 %66 to i64
  %68 = add nuw nsw i64 %57, %67
  %69 = uitofp i64 %68 to float
  %70 = fadd contract float %33, %69
  %71 = add i64 %32, 16
  %72 = icmp ult i64 %71, %4
  br i1 %72, label %31, label %73, !llvm.loop !10

73:                                               ; preds = %65, %20
  %74 = phi float [ %22, %20 ], [ %70, %65 ]
  %75 = add i64 %21, 16
  %76 = icmp ult i64 %75, %4
  br i1 %76, label %20, label %77, !llvm.loop !12

77:                                               ; preds = %73, %6
  %78 = phi float [ 0.000000e+00, %6 ], [ %74, %73 ]
  %79 = shl nuw nsw i64 %8, 4
  %80 = add nuw nsw i64 %79, %10
  %81 = trunc i64 %80 to i32
  %82 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %81
  store float %78, float addrspace(3)* %82, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = icmp ult i32 %9, 8
  br i1 %83, label %84, label %91

84:                                               ; preds = %77
  %85 = trunc i64 %80 to i32
  %86 = add nuw nsw i32 %85, 8
  %87 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %90 = fadd contract float %88, %89
  store float %90, float addrspace(3)* %82, align 4, !tbaa !5
  br label %91

91:                                               ; preds = %84, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = icmp ult i32 %9, 4
  br i1 %92, label %93, label %100

93:                                               ; preds = %91
  %94 = trunc i64 %80 to i32
  %95 = add nuw nsw i32 %94, 4
  %96 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %95
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %98 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %99 = fadd contract float %97, %98
  store float %99, float addrspace(3)* %82, align 4, !tbaa !5
  br label %100

100:                                              ; preds = %93, %91
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = icmp ult i32 %9, 2
  br i1 %101, label %102, label %109

102:                                              ; preds = %100
  %103 = trunc i64 %80 to i32
  %104 = add nuw nsw i32 %103, 2
  %105 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %104
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %108 = fadd contract float %106, %107
  store float %108, float addrspace(3)* %82, align 4, !tbaa !5
  br label %109

109:                                              ; preds = %102, %100
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = icmp eq i32 %9, 0
  br i1 %110, label %111, label %118

111:                                              ; preds = %109
  %112 = trunc i64 %80 to i32
  %113 = add nuw nsw i32 %112, 1
  %114 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %113
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !5
  %116 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %117 = fadd contract float %115, %116
  store float %117, float addrspace(3)* %82, align 4, !tbaa !5
  br label %118

118:                                              ; preds = %111, %109
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = icmp eq i32 %9, 0
  %120 = trunc i64 %79 to i32
  %121 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %120
  %122 = icmp ult i32 %7, 8
  %123 = select i1 %122, i1 %119, i1 false
  br i1 %123, label %124, label %131

124:                                              ; preds = %118
  %125 = shl nuw nsw i32 %7, 4
  %126 = add nuw nsw i32 %125, 128
  %127 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %126
  %128 = load float, float addrspace(3)* %127, align 16, !tbaa !5
  %129 = load float, float addrspace(3)* %121, align 16, !tbaa !5
  %130 = fadd contract float %128, %129
  store float %130, float addrspace(3)* %121, align 16, !tbaa !5
  br label %131

131:                                              ; preds = %124, %118
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = icmp ult i32 %7, 4
  %133 = select i1 %132, i1 %119, i1 false
  br i1 %133, label %134, label %141

134:                                              ; preds = %131
  %135 = shl nuw nsw i32 %7, 4
  %136 = add nuw nsw i32 %135, 64
  %137 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %136
  %138 = load float, float addrspace(3)* %137, align 16, !tbaa !5
  %139 = load float, float addrspace(3)* %121, align 16, !tbaa !5
  %140 = fadd contract float %138, %139
  store float %140, float addrspace(3)* %121, align 16, !tbaa !5
  br label %141

141:                                              ; preds = %134, %131
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %142 = icmp ult i32 %7, 2
  %143 = select i1 %142, i1 %119, i1 false
  br i1 %143, label %144, label %151

144:                                              ; preds = %141
  %145 = shl nuw nsw i32 %7, 4
  %146 = add nuw nsw i32 %145, 32
  %147 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %146
  %148 = load float, float addrspace(3)* %147, align 16, !tbaa !5
  %149 = load float, float addrspace(3)* %121, align 16, !tbaa !5
  %150 = fadd contract float %148, %149
  store float %150, float addrspace(3)* %121, align 16, !tbaa !5
  br label %151

151:                                              ; preds = %144, %141
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %152 = icmp eq i32 %7, 0
  %153 = select i1 %152, i1 %119, i1 false
  br i1 %153, label %154, label %161

154:                                              ; preds = %151
  %155 = shl nuw nsw i32 %7, 4
  %156 = add nuw nsw i32 %155, 16
  %157 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 %156
  %158 = load float, float addrspace(3)* %157, align 16, !tbaa !5
  %159 = load float, float addrspace(3)* %121, align 16, !tbaa !5
  %160 = fadd contract float %158, %159
  store float %160, float addrspace(3)* %121, align 16, !tbaa !5
  br label %161

161:                                              ; preds = %154, %151
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %162 = icmp eq i32 %7, 0
  %163 = select i1 %162, i1 %119, i1 false
  br i1 %163, label %164, label %178

164:                                              ; preds = %161
  %165 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ10gpuKendallPKfmS0_mmPdE10threadSums, i32 0, i32 0), align 16, !tbaa !5
  %166 = uitofp i64 %4 to float
  %167 = fadd contract float %166, -1.000000e+00
  %168 = fmul contract float %167, %166
  %169 = fmul contract float %168, 5.000000e-01
  %170 = fsub contract float %169, %165
  %171 = fsub contract float %165, %170
  %172 = fpext float %171 to double
  %173 = fpext float %169 to double
  %174 = fdiv contract double %172, %173
  %175 = mul i64 %14, %1
  %176 = add i64 %175, %12
  %177 = getelementptr inbounds double, double addrspace(1)* %5, i64 %176
  store double %174, double addrspace(1)* %177, align 8, !tbaa !13
  br label %178

178:                                              ; preds = %164, %161
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = !{!14, !14, i64 0}
!14 = !{!"double", !7, i64 0}
