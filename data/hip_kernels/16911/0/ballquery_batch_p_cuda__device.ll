; ModuleID = '../data/hip_kernels/16911/0/main.cu'
source_filename = "../data/hip_kernels/16911/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z23ballquery_batch_p_cuda_iifPKfPKiS2_PiS3_S3_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture %8) local_unnamed_addr #1 {
  %10 = alloca [1000 x i32], align 16, addrspace(5)
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %165

21:                                               ; preds = %9
  %22 = shl nsw i32 %19, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %23
  %25 = bitcast [1000 x i32] addrspace(5)* %10 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4000, i8 addrspace(5)* %25) #4
  %26 = fmul contract float %2, %2
  %27 = mul nsw i32 %19, 3
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = add nsw i32 %27, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %27, 2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = sext i32 %19 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !11, !amdgpu.noclobber !5
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %42
  %44 = bitcast i32 addrspace(1)* %43 to <2 x i32> addrspace(1)*
  %45 = load <2 x i32>, <2 x i32> addrspace(1)* %44, align 4, !tbaa !11
  %46 = extractelement <2 x i32> %45, i64 0
  %47 = extractelement <2 x i32> %45, i64 1
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %84

49:                                               ; preds = %21, %78
  %50 = phi i32 [ %79, %78 ], [ 0, %21 ]
  %51 = phi i32 [ %81, %78 ], [ %46, %21 ]
  %52 = mul nsw i32 %51, 3
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = add nsw i32 %52, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = add nsw i32 %52, 2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %3, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fsub contract float %30, %55
  %65 = fmul contract float %64, %64
  %66 = fsub contract float %34, %59
  %67 = fmul contract float %66, %66
  %68 = fadd contract float %65, %67
  %69 = fsub contract float %38, %63
  %70 = fmul contract float %69, %69
  %71 = fadd contract float %68, %70
  %72 = fcmp contract olt float %71, %26
  br i1 %72, label %73, label %78

73:                                               ; preds = %49
  %74 = icmp slt i32 %50, 1000
  br i1 %74, label %75, label %78

75:                                               ; preds = %73
  %76 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %50
  store i32 %51, i32 addrspace(5)* %76, align 4, !tbaa !11
  %77 = add nsw i32 %50, 1
  br label %78

78:                                               ; preds = %49, %75, %73
  %79 = phi i32 [ %50, %73 ], [ %77, %75 ], [ %50, %49 ]
  %80 = phi i1 [ false, %73 ], [ true, %75 ], [ true, %49 ]
  %81 = add nsw i32 %51, 1
  %82 = icmp slt i32 %81, %47
  %83 = select i1 %80, i1 %82, i1 false
  br i1 %83, label %49, label %84, !llvm.loop !13

84:                                               ; preds = %78, %21
  %85 = phi i32 [ 0, %21 ], [ %79, %78 ]
  %86 = atomicrmw add i32 addrspace(1)* %8, i32 %85 syncscope("agent-one-as") monotonic, align 4
  store i32 %86, i32 addrspace(1)* %24, align 4, !tbaa !11
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 1
  store i32 %85, i32 addrspace(1)* %87, align 4, !tbaa !11
  %88 = mul nsw i32 %1, %0
  %89 = icmp sgt i32 %88, %86
  br i1 %89, label %90, label %164

90:                                               ; preds = %84
  %91 = sext i32 %86 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %91
  %93 = add i32 %86, %85
  %94 = icmp slt i32 %93, %88
  %95 = sub nsw i32 %88, %86
  %96 = select i1 %94, i32 %85, i32 %95
  %97 = icmp sgt i32 %96, 0
  br i1 %97, label %98, label %164

98:                                               ; preds = %90
  %99 = tail call i32 @llvm.smin.i32(i32 %88, i32 %93)
  %100 = xor i32 %86, -1
  %101 = add i32 %99, %100
  %102 = and i32 %96, 7
  %103 = icmp ult i32 %101, 7
  br i1 %103, label %151, label %104

104:                                              ; preds = %98
  %105 = and i32 %96, -8
  br label %106

106:                                              ; preds = %106, %104
  %107 = phi i32 [ 0, %104 ], [ %148, %106 ]
  %108 = phi i32 [ 0, %104 ], [ %149, %106 ]
  %109 = zext i32 %107 to i64
  %110 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %107
  %111 = load i32, i32 addrspace(5)* %110, align 16, !tbaa !11
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %109
  store i32 %111, i32 addrspace(1)* %112, align 4, !tbaa !11
  %113 = or i32 %107, 1
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %113
  %116 = load i32, i32 addrspace(5)* %115, align 4, !tbaa !11
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %114
  store i32 %116, i32 addrspace(1)* %117, align 4, !tbaa !11
  %118 = or i32 %107, 2
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %118
  %121 = load i32, i32 addrspace(5)* %120, align 8, !tbaa !11
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %119
  store i32 %121, i32 addrspace(1)* %122, align 4, !tbaa !11
  %123 = or i32 %107, 3
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %123
  %126 = load i32, i32 addrspace(5)* %125, align 4, !tbaa !11
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %124
  store i32 %126, i32 addrspace(1)* %127, align 4, !tbaa !11
  %128 = or i32 %107, 4
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %128
  %131 = load i32, i32 addrspace(5)* %130, align 16, !tbaa !11
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %129
  store i32 %131, i32 addrspace(1)* %132, align 4, !tbaa !11
  %133 = or i32 %107, 5
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %133
  %136 = load i32, i32 addrspace(5)* %135, align 4, !tbaa !11
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %134
  store i32 %136, i32 addrspace(1)* %137, align 4, !tbaa !11
  %138 = or i32 %107, 6
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %138
  %141 = load i32, i32 addrspace(5)* %140, align 8, !tbaa !11
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %139
  store i32 %141, i32 addrspace(1)* %142, align 4, !tbaa !11
  %143 = or i32 %107, 7
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %143
  %146 = load i32, i32 addrspace(5)* %145, align 4, !tbaa !11
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %144
  store i32 %146, i32 addrspace(1)* %147, align 4, !tbaa !11
  %148 = add nuw nsw i32 %107, 8
  %149 = add i32 %108, 8
  %150 = icmp eq i32 %149, %105
  br i1 %150, label %151, label %106, !llvm.loop !15

151:                                              ; preds = %106, %98
  %152 = phi i32 [ 0, %98 ], [ %148, %106 ]
  %153 = icmp eq i32 %102, 0
  br i1 %153, label %164, label %154

154:                                              ; preds = %151, %154
  %155 = phi i32 [ %161, %154 ], [ %152, %151 ]
  %156 = phi i32 [ %162, %154 ], [ 0, %151 ]
  %157 = zext i32 %155 to i64
  %158 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %10, i32 0, i32 %155
  %159 = load i32, i32 addrspace(5)* %158, align 4, !tbaa !11
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 %157
  store i32 %159, i32 addrspace(1)* %160, align 4, !tbaa !11
  %161 = add nuw nsw i32 %155, 1
  %162 = add i32 %156, 1
  %163 = icmp eq i32 %162, %102
  br i1 %163, label %164, label %154, !llvm.loop !16

164:                                              ; preds = %151, %154, %90, %84
  call void @llvm.lifetime.end.p5i8(i64 4000, i8 addrspace(5)* %25) #4
  br label %165

165:                                              ; preds = %9, %164
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
