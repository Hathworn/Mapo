; ModuleID = '../data/hip_kernels/2482/9/main.cu'
source_filename = "../data/hip_kernels/2482/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22back_prop_kernel_batchPfS_S_S_S_iiifiE11weightedSum.0 = internal unnamed_addr addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22back_prop_kernel_batchPfS_S_S_S_iiifi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, float %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = freeze i32 %12
  %14 = freeze i32 %6
  %15 = udiv i32 %13, %14
  %16 = mul i32 %15, %14
  %17 = sub i32 %13, %16
  %18 = icmp eq i32 %11, 0
  %19 = icmp slt i32 %17, %6
  %20 = select i1 %18, i1 %19, i1 false
  %21 = icmp sgt i32 %7, 0
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %23, label %150

23:                                               ; preds = %10
  %24 = load float, float addrspace(3)* @_ZZ22back_prop_kernel_batchPfS_S_S_S_iiifiE11weightedSum.0, align 4, !tbaa !5
  %25 = mul nsw i32 %17, %7
  %26 = add nuw nsw i32 %7, 1
  %27 = mul nsw i32 %15, %26
  %28 = and i32 %7, 7
  %29 = icmp ult i32 %7, 8
  br i1 %29, label %126, label %30

30:                                               ; preds = %23
  %31 = and i32 %7, -8
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i32 [ 0, %30 ], [ %123, %32 ]
  %34 = phi float [ %24, %30 ], [ %122, %32 ]
  %35 = phi i32 [ 0, %30 ], [ %124, %32 ]
  %36 = add nsw i32 %33, %25
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = add nsw i32 %33, %27
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = fmul contract float %39, %43
  %45 = fadd contract float %34, %44
  %46 = or i32 %33, 1
  %47 = add nsw i32 %46, %25
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = add nsw i32 %46, %27
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fmul contract float %50, %54
  %56 = fadd contract float %45, %55
  %57 = or i32 %33, 2
  %58 = add nsw i32 %57, %25
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = add nsw i32 %57, %27
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = fmul contract float %61, %65
  %67 = fadd contract float %56, %66
  %68 = or i32 %33, 3
  %69 = add nsw i32 %68, %25
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = add nsw i32 %68, %27
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %67, %77
  %79 = or i32 %33, 4
  %80 = add nsw i32 %79, %25
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = add nsw i32 %79, %27
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = fmul contract float %83, %87
  %89 = fadd contract float %78, %88
  %90 = or i32 %33, 5
  %91 = add nsw i32 %90, %25
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = add nsw i32 %90, %27
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  %99 = fmul contract float %94, %98
  %100 = fadd contract float %89, %99
  %101 = or i32 %33, 6
  %102 = add nsw i32 %101, %25
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = add nsw i32 %101, %27
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %4, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = fmul contract float %105, %109
  %111 = fadd contract float %100, %110
  %112 = or i32 %33, 7
  %113 = add nsw i32 %112, %25
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %3, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = add nsw i32 %112, %27
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %4, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = fmul contract float %116, %120
  %122 = fadd contract float %111, %121
  %123 = add nuw nsw i32 %33, 8
  %124 = add i32 %35, 8
  %125 = icmp eq i32 %124, %31
  br i1 %125, label %126, label %32, !llvm.loop !10

126:                                              ; preds = %32, %23
  %127 = phi float [ undef, %23 ], [ %122, %32 ]
  %128 = phi i32 [ 0, %23 ], [ %123, %32 ]
  %129 = phi float [ %24, %23 ], [ %122, %32 ]
  %130 = icmp eq i32 %28, 0
  br i1 %130, label %148, label %131

131:                                              ; preds = %126, %131
  %132 = phi i32 [ %145, %131 ], [ %128, %126 ]
  %133 = phi float [ %144, %131 ], [ %129, %126 ]
  %134 = phi i32 [ %146, %131 ], [ 0, %126 ]
  %135 = add nsw i32 %132, %25
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %3, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = add nsw i32 %132, %27
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %4, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5, !amdgpu.noclobber !9
  %143 = fmul contract float %138, %142
  %144 = fadd contract float %133, %143
  %145 = add nuw nsw i32 %132, 1
  %146 = add i32 %134, 1
  %147 = icmp eq i32 %146, %28
  br i1 %147, label %148, label %131, !llvm.loop !12

148:                                              ; preds = %131, %126
  %149 = phi float [ %127, %126 ], [ %144, %131 ]
  store float %149, float addrspace(3)* @_ZZ22back_prop_kernel_batchPfS_S_S_S_iiifiE11weightedSum.0, align 4, !tbaa !5
  br label %150

150:                                              ; preds = %148, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = icmp slt i32 %11, %5
  br i1 %151, label %152, label %176

152:                                              ; preds = %150
  %153 = add nuw nsw i32 %5, 1
  %154 = mul nsw i32 %15, %153
  %155 = add nsw i32 %154, %11
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !5, !amdgpu.noclobber !9
  %159 = fmul contract float %158, %8
  %160 = add nsw i32 %6, 1
  %161 = mul nsw i32 %15, %160
  %162 = add nsw i32 %161, %17
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !5, !amdgpu.noclobber !9
  %166 = fmul contract float %159, %165
  %167 = fsub contract float 1.000000e+00, %165
  %168 = fmul contract float %166, %167
  %169 = load float, float addrspace(3)* @_ZZ22back_prop_kernel_batchPfS_S_S_S_iiifiE11weightedSum.0, align 4, !tbaa !5
  %170 = fmul contract float %169, %168
  %171 = mul nsw i32 %11, %6
  %172 = add nsw i32 %17, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %173
  %175 = atomicrmw fadd float addrspace(1)* %174, float %170 syncscope("agent-one-as") monotonic, align 4
  br label %176

176:                                              ; preds = %152, %150
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
