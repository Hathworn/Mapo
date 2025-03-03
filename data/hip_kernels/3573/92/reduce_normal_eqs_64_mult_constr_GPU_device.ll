; ModuleID = '../data/hip_kernels/3573/92/main.cu'
source_filename = "../data/hip_kernels/3573/92/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z36reduce_normal_eqs_64_mult_constr_GPUPfPKfii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 2
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = icmp slt i32 %8, %3
  br i1 %9, label %10, label %154

10:                                               ; preds = %4
  %11 = shl nuw nsw i32 %7, 6
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = add nuw nsw i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = mul i32 %14, %3
  %16 = add i32 %15, %8
  %17 = mul i32 %16, %2
  %18 = icmp sgt i32 %2, 0
  br i1 %18, label %19, label %43

19:                                               ; preds = %10
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %2, -8
  br label %47

24:                                               ; preds = %47, %19
  %25 = phi float [ undef, %19 ], [ %113, %47 ]
  %26 = phi i32 [ 0, %19 ], [ %114, %47 ]
  %27 = phi float [ 0.000000e+00, %19 ], [ %113, %47 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %43, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %40, %29 ], [ %26, %24 ]
  %31 = phi float [ %39, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %41, %29 ], [ 0, %24 ]
  %33 = add i32 %30, %17
  %34 = shl i32 %33, 6
  %35 = add i32 %34, %12
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fadd contract float %31, %38
  %40 = add nuw nsw i32 %30, 1
  %41 = add i32 %32, 1
  %42 = icmp eq i32 %41, %20
  br i1 %42, label %43, label %29, !llvm.loop !10

43:                                               ; preds = %24, %29, %10
  %44 = phi float [ 0.000000e+00, %10 ], [ %25, %24 ], [ %39, %29 ]
  %45 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %13
  store float %44, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ult i32 %12, 32
  br i1 %46, label %117, label %148

47:                                               ; preds = %47, %22
  %48 = phi i32 [ 0, %22 ], [ %114, %47 ]
  %49 = phi float [ 0.000000e+00, %22 ], [ %113, %47 ]
  %50 = phi i32 [ 0, %22 ], [ %115, %47 ]
  %51 = add i32 %48, %17
  %52 = shl i32 %51, 6
  %53 = add i32 %52, %12
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = fadd contract float %49, %56
  %58 = or i32 %48, 1
  %59 = add i32 %58, %17
  %60 = shl i32 %59, 6
  %61 = add i32 %60, %12
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = fadd contract float %57, %64
  %66 = or i32 %48, 2
  %67 = add i32 %66, %17
  %68 = shl i32 %67, 6
  %69 = add i32 %68, %12
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fadd contract float %65, %72
  %74 = or i32 %48, 3
  %75 = add i32 %74, %17
  %76 = shl i32 %75, 6
  %77 = add i32 %76, %12
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = fadd contract float %73, %80
  %82 = or i32 %48, 4
  %83 = add i32 %82, %17
  %84 = shl i32 %83, 6
  %85 = add i32 %84, %12
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = fadd contract float %81, %88
  %90 = or i32 %48, 5
  %91 = add i32 %90, %17
  %92 = shl i32 %91, 6
  %93 = add i32 %92, %12
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fadd contract float %89, %96
  %98 = or i32 %48, 6
  %99 = add i32 %98, %17
  %100 = shl i32 %99, 6
  %101 = add i32 %100, %12
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fadd contract float %97, %104
  %106 = or i32 %48, 7
  %107 = add i32 %106, %17
  %108 = shl i32 %107, 6
  %109 = add i32 %108, %12
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5, !amdgpu.noclobber !9
  %113 = fadd contract float %105, %112
  %114 = add nuw nsw i32 %48, 8
  %115 = add i32 %50, 8
  %116 = icmp eq i32 %115, %23
  br i1 %116, label %24, label %47, !llvm.loop !12

117:                                              ; preds = %43
  %118 = add nuw nsw i32 %13, 32
  %119 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !5
  %121 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %122 = fadd contract float %120, %121
  store float %122, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %123 = add nuw nsw i32 %13, 16
  %124 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %126 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %127 = fadd contract float %125, %126
  store float %127, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = add nuw nsw i32 %13, 8
  %129 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %132 = fadd contract float %130, %131
  store float %132, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = add nuw nsw i32 %13, 4
  %134 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %136 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %137 = fadd contract float %135, %136
  store float %137, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = add nuw nsw i32 %13, 2
  %139 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %138
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %141 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %142 = fadd contract float %140, %141
  store float %142, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = add nuw nsw i32 %13, 1
  %144 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ36reduce_normal_eqs_64_mult_constr_GPUPfPKfiiE4DATA, i32 0, i32 %143
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !5
  %146 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %147 = fadd contract float %145, %146
  store float %147, float addrspace(3)* %45, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %148

148:                                              ; preds = %117, %43
  %149 = icmp eq i32 %12, 0
  br i1 %149, label %150, label %154

150:                                              ; preds = %148
  %151 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %152 = zext i32 %16 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  store float %151, float addrspace(1)* %153, align 4, !tbaa !5
  br label %154

154:                                              ; preds = %148, %150, %4
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
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
