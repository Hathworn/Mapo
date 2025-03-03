; ModuleID = '../data/hip_kernels/2482/8/main.cu'
source_filename = "../data/hip_kernels/2482/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16back_prop_kernelPfS_S_S_S_iiifE11weightedSum.0 = internal unnamed_addr addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16back_prop_kernelPfS_S_S_S_iiif(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp eq i32 %10, 0
  %13 = icmp sgt i32 %7, 0
  %14 = select i1 %12, i1 %13, i1 false
  br i1 %14, label %15, label %131

15:                                               ; preds = %9
  %16 = load float, float addrspace(3)* @_ZZ16back_prop_kernelPfS_S_S_S_iiifE11weightedSum.0, align 4, !tbaa !5
  %17 = mul nsw i32 %11, %7
  %18 = and i32 %7, 7
  %19 = icmp ult i32 %7, 8
  br i1 %19, label %108, label %20

20:                                               ; preds = %15
  %21 = and i32 %7, -8
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %105, %22 ]
  %24 = phi float [ %16, %20 ], [ %104, %22 ]
  %25 = phi i32 [ 0, %20 ], [ %106, %22 ]
  %26 = add nsw i32 %23, %17
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = zext i32 %23 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fmul contract float %29, %32
  %34 = fadd contract float %24, %33
  %35 = or i32 %23, 1
  %36 = add nsw i32 %35, %17
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = zext i32 %35 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %4, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = fmul contract float %39, %42
  %44 = fadd contract float %34, %43
  %45 = or i32 %23, 2
  %46 = add nsw i32 %45, %17
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = zext i32 %45 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fmul contract float %49, %52
  %54 = fadd contract float %44, %53
  %55 = or i32 %23, 3
  %56 = add nsw i32 %55, %17
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = zext i32 %55 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = fmul contract float %59, %62
  %64 = fadd contract float %54, %63
  %65 = or i32 %23, 4
  %66 = add nsw i32 %65, %17
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = zext i32 %65 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %4, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fmul contract float %69, %72
  %74 = fadd contract float %64, %73
  %75 = or i32 %23, 5
  %76 = add nsw i32 %75, %17
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = zext i32 %75 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %4, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = fmul contract float %79, %82
  %84 = fadd contract float %74, %83
  %85 = or i32 %23, 6
  %86 = add nsw i32 %85, %17
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = zext i32 %85 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = fmul contract float %89, %92
  %94 = fadd contract float %84, %93
  %95 = or i32 %23, 7
  %96 = add nsw i32 %95, %17
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %3, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = zext i32 %95 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %4, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = fmul contract float %99, %102
  %104 = fadd contract float %94, %103
  %105 = add nuw nsw i32 %23, 8
  %106 = add i32 %25, 8
  %107 = icmp eq i32 %106, %21
  br i1 %107, label %108, label %22, !llvm.loop !10

108:                                              ; preds = %22, %15
  %109 = phi float [ undef, %15 ], [ %104, %22 ]
  %110 = phi i32 [ 0, %15 ], [ %105, %22 ]
  %111 = phi float [ %16, %15 ], [ %104, %22 ]
  %112 = icmp eq i32 %18, 0
  br i1 %112, label %129, label %113

113:                                              ; preds = %108, %113
  %114 = phi i32 [ %126, %113 ], [ %110, %108 ]
  %115 = phi float [ %125, %113 ], [ %111, %108 ]
  %116 = phi i32 [ %127, %113 ], [ 0, %108 ]
  %117 = add nsw i32 %114, %17
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %3, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = zext i32 %114 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %4, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = fmul contract float %120, %123
  %125 = fadd contract float %115, %124
  %126 = add nuw nsw i32 %114, 1
  %127 = add i32 %116, 1
  %128 = icmp eq i32 %127, %18
  br i1 %128, label %129, label %113, !llvm.loop !12

129:                                              ; preds = %113, %108
  %130 = phi float [ %109, %108 ], [ %125, %113 ]
  store float %130, float addrspace(3)* @_ZZ16back_prop_kernelPfS_S_S_S_iiifE11weightedSum.0, align 4, !tbaa !5
  br label %131

131:                                              ; preds = %129, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %132 = icmp slt i32 %10, %5
  br i1 %132, label %133, label %150

133:                                              ; preds = %131
  %134 = zext i32 %10 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fmul contract float %136, %8
  %138 = sext i32 %11 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %2, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5, !amdgpu.noclobber !9
  %141 = fmul contract float %137, %140
  %142 = fsub contract float 1.000000e+00, %140
  %143 = fmul contract float %141, %142
  %144 = load float, float addrspace(3)* @_ZZ16back_prop_kernelPfS_S_S_S_iiifE11weightedSum.0, align 4, !tbaa !5
  %145 = fmul contract float %144, %143
  %146 = mul nsw i32 %10, %6
  %147 = add nsw i32 %146, %11
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  store float %145, float addrspace(1)* %149, align 4, !tbaa !5
  br label %150

150:                                              ; preds = %133, %131
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
