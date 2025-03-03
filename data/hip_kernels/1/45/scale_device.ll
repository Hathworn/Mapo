; ModuleID = '../data/hip_kernels/1/45/main.cu'
source_filename = "../data/hip_kernels/1/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5scalefiiPfi(float %0, i32 %1, i32 %2, float addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %180

16:                                               ; preds = %5
  %17 = mul nsw i32 %14, %4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %3, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = icmp sgt i32 %2, 1
  br i1 %21, label %22, label %51

22:                                               ; preds = %16
  %23 = add i32 %2, -1
  %24 = add i32 %2, -2
  %25 = and i32 %23, 7
  %26 = icmp ult i32 %24, 7
  br i1 %26, label %29, label %27

27:                                               ; preds = %22
  %28 = and i32 %23, -8
  br label %61

29:                                               ; preds = %61, %22
  %30 = phi float [ undef, %22 ], [ %126, %61 ]
  %31 = phi float [ undef, %22 ], [ %128, %61 ]
  %32 = phi i32 [ 1, %22 ], [ %129, %61 ]
  %33 = phi float [ %20, %22 ], [ %126, %61 ]
  %34 = phi float [ %20, %22 ], [ %128, %61 ]
  %35 = icmp eq i32 %25, 0
  br i1 %35, label %51, label %36

36:                                               ; preds = %29, %36
  %37 = phi i32 [ %48, %36 ], [ %32, %29 ]
  %38 = phi float [ %45, %36 ], [ %33, %29 ]
  %39 = phi float [ %47, %36 ], [ %34, %29 ]
  %40 = phi i32 [ %49, %36 ], [ 0, %29 ]
  %41 = zext i32 %37 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %19, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fcmp contract olt float %43, %38
  %45 = select i1 %44, float %43, float %38
  %46 = fcmp contract ogt float %43, %39
  %47 = select i1 %46, float %43, float %39
  %48 = add nuw nsw i32 %37, 1
  %49 = add i32 %40, 1
  %50 = icmp eq i32 %49, %25
  br i1 %50, label %51, label %36, !llvm.loop !11

51:                                               ; preds = %29, %36, %16
  %52 = phi float [ %20, %16 ], [ %31, %29 ], [ %47, %36 ]
  %53 = phi float [ %20, %16 ], [ %30, %29 ], [ %45, %36 ]
  %54 = fsub contract float %52, %53
  %55 = icmp sgt i32 %2, 0
  br i1 %55, label %56, label %180

56:                                               ; preds = %51
  %57 = and i32 %2, 3
  %58 = icmp ult i32 %2, 4
  br i1 %58, label %165, label %59

59:                                               ; preds = %56
  %60 = and i32 %2, -4
  br label %132

61:                                               ; preds = %61, %27
  %62 = phi i32 [ 1, %27 ], [ %129, %61 ]
  %63 = phi float [ %20, %27 ], [ %126, %61 ]
  %64 = phi float [ %20, %27 ], [ %128, %61 ]
  %65 = phi i32 [ 0, %27 ], [ %130, %61 ]
  %66 = zext i32 %62 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %19, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fcmp contract olt float %68, %63
  %70 = select i1 %69, float %68, float %63
  %71 = fcmp contract ogt float %68, %64
  %72 = select i1 %71, float %68, float %64
  %73 = add nuw nsw i32 %62, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %19, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = fcmp contract olt float %76, %70
  %78 = select i1 %77, float %76, float %70
  %79 = fcmp contract ogt float %76, %72
  %80 = select i1 %79, float %76, float %72
  %81 = add nuw nsw i32 %62, 2
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %19, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fcmp contract olt float %84, %78
  %86 = select i1 %85, float %84, float %78
  %87 = fcmp contract ogt float %84, %80
  %88 = select i1 %87, float %84, float %80
  %89 = add nuw nsw i32 %62, 3
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %19, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fcmp contract olt float %92, %86
  %94 = select i1 %93, float %92, float %86
  %95 = fcmp contract ogt float %92, %88
  %96 = select i1 %95, float %92, float %88
  %97 = add nuw nsw i32 %62, 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %19, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fcmp contract olt float %100, %94
  %102 = select i1 %101, float %100, float %94
  %103 = fcmp contract ogt float %100, %96
  %104 = select i1 %103, float %100, float %96
  %105 = add nuw nsw i32 %62, 5
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %19, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fcmp contract olt float %108, %102
  %110 = select i1 %109, float %108, float %102
  %111 = fcmp contract ogt float %108, %104
  %112 = select i1 %111, float %108, float %104
  %113 = add nuw nsw i32 %62, 6
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %19, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fcmp contract olt float %116, %110
  %118 = select i1 %117, float %116, float %110
  %119 = fcmp contract ogt float %116, %112
  %120 = select i1 %119, float %116, float %112
  %121 = add nuw nsw i32 %62, 7
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %19, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = fcmp contract olt float %124, %118
  %126 = select i1 %125, float %124, float %118
  %127 = fcmp contract ogt float %124, %120
  %128 = select i1 %127, float %124, float %120
  %129 = add nuw nsw i32 %62, 8
  %130 = add i32 %65, 8
  %131 = icmp eq i32 %130, %28
  br i1 %131, label %29, label %61, !llvm.loop !13

132:                                              ; preds = %132, %59
  %133 = phi i32 [ 0, %59 ], [ %162, %132 ]
  %134 = phi i32 [ 0, %59 ], [ %163, %132 ]
  %135 = zext i32 %133 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %19, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7
  %138 = fsub contract float %137, %53
  %139 = fmul contract float %138, %0
  %140 = fdiv contract float %139, %54
  store float %140, float addrspace(1)* %136, align 4, !tbaa !7
  %141 = or i32 %133, 1
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %19, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = fsub contract float %144, %53
  %146 = fmul contract float %145, %0
  %147 = fdiv contract float %146, %54
  store float %147, float addrspace(1)* %143, align 4, !tbaa !7
  %148 = or i32 %133, 2
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %19, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = fsub contract float %151, %53
  %153 = fmul contract float %152, %0
  %154 = fdiv contract float %153, %54
  store float %154, float addrspace(1)* %150, align 4, !tbaa !7
  %155 = or i32 %133, 3
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %19, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = fsub contract float %158, %53
  %160 = fmul contract float %159, %0
  %161 = fdiv contract float %160, %54
  store float %161, float addrspace(1)* %157, align 4, !tbaa !7
  %162 = add nuw nsw i32 %133, 4
  %163 = add i32 %134, 4
  %164 = icmp eq i32 %163, %60
  br i1 %164, label %165, label %132, !llvm.loop !15

165:                                              ; preds = %132, %56
  %166 = phi i32 [ 0, %56 ], [ %162, %132 ]
  %167 = icmp eq i32 %57, 0
  br i1 %167, label %180, label %168

168:                                              ; preds = %165, %168
  %169 = phi i32 [ %177, %168 ], [ %166, %165 ]
  %170 = phi i32 [ %178, %168 ], [ 0, %165 ]
  %171 = zext i32 %169 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %19, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %174 = fsub contract float %173, %53
  %175 = fmul contract float %174, %0
  %176 = fdiv contract float %175, %54
  store float %176, float addrspace(1)* %172, align 4, !tbaa !7
  %177 = add nuw nsw i32 %169, 1
  %178 = add i32 %170, 1
  %179 = icmp eq i32 %178, %57
  br i1 %179, label %180, label %168, !llvm.loop !16

180:                                              ; preds = %165, %168, %51, %5
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
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
