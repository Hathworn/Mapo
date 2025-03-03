; ModuleID = '../data/hip_kernels/59/136/main.cu'
source_filename = "../data/hip_kernels/59/136/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20kHingeLinearRowMajorPfS_S_jjf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %4
  br i1 %16, label %17, label %172

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = fptosi float %22 to i32
  %24 = mul i32 %23, %4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %19, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = icmp eq i32 %3, 0
  br i1 %28, label %58, label %29

29:                                               ; preds = %17
  %30 = and i32 %3, 7
  %31 = icmp ult i32 %3, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = and i32 %3, -8
  br label %62

34:                                               ; preds = %62, %29
  %35 = phi float [ undef, %29 ], [ %168, %62 ]
  %36 = phi i32 [ 0, %29 ], [ %169, %62 ]
  %37 = phi float [ 0.000000e+00, %29 ], [ %168, %62 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %58, label %39

39:                                               ; preds = %34, %39
  %40 = phi i32 [ %55, %39 ], [ %36, %34 ]
  %41 = phi float [ %54, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %56, %39 ], [ 0, %34 ]
  %43 = mul i32 %40, %4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %19, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %46, %5
  %48 = fsub contract float %47, %27
  %49 = fcmp contract ogt float %48, 0.000000e+00
  %50 = uitofp i1 %49 to float
  %51 = icmp eq i32 %40, %23
  %52 = select contract i1 %51, float 0.000000e+00, float %50
  %53 = getelementptr inbounds float, float addrspace(1)* %20, i64 %44
  store float %52, float addrspace(1)* %53, align 4, !tbaa !7
  %54 = fadd contract float %41, %52
  %55 = add nuw i32 %40, 1
  %56 = add i32 %42, 1
  %57 = icmp eq i32 %56, %30
  br i1 %57, label %58, label %39, !llvm.loop !11

58:                                               ; preds = %34, %39, %17
  %59 = phi float [ 0.000000e+00, %17 ], [ %35, %34 ], [ %54, %39 ]
  %60 = fneg contract float %59
  %61 = getelementptr inbounds float, float addrspace(1)* %20, i64 %25
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  br label %172

62:                                               ; preds = %62, %32
  %63 = phi i32 [ 0, %32 ], [ %169, %62 ]
  %64 = phi float [ 0.000000e+00, %32 ], [ %168, %62 ]
  %65 = phi i32 [ 0, %32 ], [ %170, %62 ]
  %66 = mul i32 %63, %4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %19, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fadd contract float %69, %5
  %71 = fsub contract float %70, %27
  %72 = fcmp contract ogt float %71, 0.000000e+00
  %73 = uitofp i1 %72 to float
  %74 = icmp eq i32 %63, %23
  %75 = select contract i1 %74, float 0.000000e+00, float %73
  %76 = getelementptr inbounds float, float addrspace(1)* %20, i64 %67
  store float %75, float addrspace(1)* %76, align 4, !tbaa !7
  %77 = fadd contract float %64, %75
  %78 = or i32 %63, 1
  %79 = mul i32 %78, %4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %19, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %82, %5
  %84 = fsub contract float %83, %27
  %85 = fcmp contract ogt float %84, 0.000000e+00
  %86 = uitofp i1 %85 to float
  %87 = icmp eq i32 %78, %23
  %88 = select contract i1 %87, float 0.000000e+00, float %86
  %89 = getelementptr inbounds float, float addrspace(1)* %20, i64 %80
  store float %88, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = fadd contract float %77, %88
  %91 = or i32 %63, 2
  %92 = mul i32 %91, %4
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %19, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fadd contract float %95, %5
  %97 = fsub contract float %96, %27
  %98 = fcmp contract ogt float %97, 0.000000e+00
  %99 = uitofp i1 %98 to float
  %100 = icmp eq i32 %91, %23
  %101 = select contract i1 %100, float 0.000000e+00, float %99
  %102 = getelementptr inbounds float, float addrspace(1)* %20, i64 %93
  store float %101, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = fadd contract float %90, %101
  %104 = or i32 %63, 3
  %105 = mul i32 %104, %4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %19, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fadd contract float %108, %5
  %110 = fsub contract float %109, %27
  %111 = fcmp contract ogt float %110, 0.000000e+00
  %112 = uitofp i1 %111 to float
  %113 = icmp eq i32 %104, %23
  %114 = select contract i1 %113, float 0.000000e+00, float %112
  %115 = getelementptr inbounds float, float addrspace(1)* %20, i64 %106
  store float %114, float addrspace(1)* %115, align 4, !tbaa !7
  %116 = fadd contract float %103, %114
  %117 = or i32 %63, 4
  %118 = mul i32 %117, %4
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %19, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fadd contract float %121, %5
  %123 = fsub contract float %122, %27
  %124 = fcmp contract ogt float %123, 0.000000e+00
  %125 = uitofp i1 %124 to float
  %126 = icmp eq i32 %117, %23
  %127 = select contract i1 %126, float 0.000000e+00, float %125
  %128 = getelementptr inbounds float, float addrspace(1)* %20, i64 %119
  store float %127, float addrspace(1)* %128, align 4, !tbaa !7
  %129 = fadd contract float %116, %127
  %130 = or i32 %63, 5
  %131 = mul i32 %130, %4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %19, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fadd contract float %134, %5
  %136 = fsub contract float %135, %27
  %137 = fcmp contract ogt float %136, 0.000000e+00
  %138 = uitofp i1 %137 to float
  %139 = icmp eq i32 %130, %23
  %140 = select contract i1 %139, float 0.000000e+00, float %138
  %141 = getelementptr inbounds float, float addrspace(1)* %20, i64 %132
  store float %140, float addrspace(1)* %141, align 4, !tbaa !7
  %142 = fadd contract float %129, %140
  %143 = or i32 %63, 6
  %144 = mul i32 %143, %4
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %19, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = fadd contract float %147, %5
  %149 = fsub contract float %148, %27
  %150 = fcmp contract ogt float %149, 0.000000e+00
  %151 = uitofp i1 %150 to float
  %152 = icmp eq i32 %143, %23
  %153 = select contract i1 %152, float 0.000000e+00, float %151
  %154 = getelementptr inbounds float, float addrspace(1)* %20, i64 %145
  store float %153, float addrspace(1)* %154, align 4, !tbaa !7
  %155 = fadd contract float %142, %153
  %156 = or i32 %63, 7
  %157 = mul i32 %156, %4
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %19, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7
  %161 = fadd contract float %160, %5
  %162 = fsub contract float %161, %27
  %163 = fcmp contract ogt float %162, 0.000000e+00
  %164 = uitofp i1 %163 to float
  %165 = icmp eq i32 %156, %23
  %166 = select contract i1 %165, float 0.000000e+00, float %164
  %167 = getelementptr inbounds float, float addrspace(1)* %20, i64 %158
  store float %166, float addrspace(1)* %167, align 4, !tbaa !7
  %168 = fadd contract float %155, %166
  %169 = add nuw i32 %63, 8
  %170 = add i32 %65, 8
  %171 = icmp eq i32 %170, %33
  br i1 %171, label %34, label %62, !llvm.loop !13

172:                                              ; preds = %58, %6
  ret void
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
