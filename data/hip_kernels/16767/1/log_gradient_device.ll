; ModuleID = '../data/hip_kernels/16767/1/main.cu'
source_filename = "../data/hip_kernels/16767/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@features = protected addrspace(4) externally_initialized global i32 26, align 4
@num_rows = protected addrspace(4) externally_initialized global i32 16896, align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @features to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @num_rows to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12log_gradientPfS_S_S_Pi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readnone %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = load i32, i32 addrspace(4)* @num_rows, align 4, !tbaa !7
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %49

17:                                               ; preds = %5
  %18 = load i32, i32 addrspace(4)* @features, align 4, !tbaa !7
  %19 = and i32 %15, 7
  %20 = icmp ult i32 %15, 8
  br i1 %20, label %23, label %21

21:                                               ; preds = %17
  %22 = and i32 %15, -8
  br label %53

23:                                               ; preds = %53, %17
  %24 = phi float [ undef, %17 ], [ %175, %53 ]
  %25 = phi float [ 0.000000e+00, %17 ], [ %175, %53 ]
  %26 = phi i32 [ 0, %17 ], [ %176, %53 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %49, label %28

28:                                               ; preds = %23, %28
  %29 = phi float [ %45, %28 ], [ %25, %23 ]
  %30 = phi i32 [ %46, %28 ], [ %26, %23 ]
  %31 = phi i32 [ %47, %28 ], [ 0, %23 ]
  %32 = zext i32 %30 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !11, !amdgpu.noclobber !5
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %32
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = sitofp i32 %36 to float
  %38 = fsub contract float %34, %37
  %39 = mul nsw i32 %18, %30
  %40 = add nsw i32 %39, %14
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11, !amdgpu.noclobber !5
  %44 = fmul contract float %38, %43
  %45 = fadd contract float %29, %44
  %46 = add nuw nsw i32 %30, 1
  %47 = add i32 %31, 1
  %48 = icmp eq i32 %47, %19
  br i1 %48, label %49, label %28, !llvm.loop !13

49:                                               ; preds = %23, %28, %5
  %50 = phi float [ 0.000000e+00, %5 ], [ %24, %23 ], [ %45, %28 ]
  %51 = sext i32 %14 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !11
  ret void

53:                                               ; preds = %53, %21
  %54 = phi float [ 0.000000e+00, %21 ], [ %175, %53 ]
  %55 = phi i32 [ 0, %21 ], [ %176, %53 ]
  %56 = phi i32 [ 0, %21 ], [ %177, %53 ]
  %57 = zext i32 %55 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11, !amdgpu.noclobber !5
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %57
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = sitofp i32 %61 to float
  %63 = fsub contract float %59, %62
  %64 = mul nsw i32 %18, %55
  %65 = add nsw i32 %64, %14
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !11, !amdgpu.noclobber !5
  %69 = fmul contract float %63, %68
  %70 = fadd contract float %54, %69
  %71 = or i32 %55, 1
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !11, !amdgpu.noclobber !5
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %72
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = sitofp i32 %76 to float
  %78 = fsub contract float %74, %77
  %79 = mul nsw i32 %18, %71
  %80 = add nsw i32 %79, %14
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11, !amdgpu.noclobber !5
  %84 = fmul contract float %78, %83
  %85 = fadd contract float %70, %84
  %86 = or i32 %55, 2
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11, !amdgpu.noclobber !5
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %87
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = sitofp i32 %91 to float
  %93 = fsub contract float %89, %92
  %94 = mul nsw i32 %18, %86
  %95 = add nsw i32 %94, %14
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11, !amdgpu.noclobber !5
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %85, %99
  %101 = or i32 %55, 3
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !11, !amdgpu.noclobber !5
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %102
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = sitofp i32 %106 to float
  %108 = fsub contract float %104, %107
  %109 = mul nsw i32 %18, %101
  %110 = add nsw i32 %109, %14
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %3, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !11, !amdgpu.noclobber !5
  %114 = fmul contract float %108, %113
  %115 = fadd contract float %100, %114
  %116 = or i32 %55, 4
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !11, !amdgpu.noclobber !5
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %117
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = sitofp i32 %121 to float
  %123 = fsub contract float %119, %122
  %124 = mul nsw i32 %18, %116
  %125 = add nsw i32 %124, %14
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %3, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !11, !amdgpu.noclobber !5
  %129 = fmul contract float %123, %128
  %130 = fadd contract float %115, %129
  %131 = or i32 %55, 5
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !11, !amdgpu.noclobber !5
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %132
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = sitofp i32 %136 to float
  %138 = fsub contract float %134, %137
  %139 = mul nsw i32 %18, %131
  %140 = add nsw i32 %139, %14
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !11, !amdgpu.noclobber !5
  %144 = fmul contract float %138, %143
  %145 = fadd contract float %130, %144
  %146 = or i32 %55, 6
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11, !amdgpu.noclobber !5
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %147
  %151 = load i32, i32 addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = sitofp i32 %151 to float
  %153 = fsub contract float %149, %152
  %154 = mul nsw i32 %18, %146
  %155 = add nsw i32 %154, %14
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %3, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !11, !amdgpu.noclobber !5
  %159 = fmul contract float %153, %158
  %160 = fadd contract float %145, %159
  %161 = or i32 %55, 7
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !11, !amdgpu.noclobber !5
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %162
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = sitofp i32 %166 to float
  %168 = fsub contract float %164, %167
  %169 = mul nsw i32 %18, %161
  %170 = add nsw i32 %169, %14
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %3, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !11, !amdgpu.noclobber !5
  %174 = fmul contract float %168, %173
  %175 = fadd contract float %160, %174
  %176 = add nuw nsw i32 %55, 8
  %177 = add i32 %56, 8
  %178 = icmp eq i32 %177, %22
  br i1 %178, label %23, label %53, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
