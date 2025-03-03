; ModuleID = '../data/hip_kernels/14174/3/main.cu'
source_filename = "../data/hip_kernels/14174/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9laplacianPfPKfmmm(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i64 %2, i64 %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = freeze i64 %15
  %17 = freeze i64 %2
  %18 = udiv i64 %16, %17
  %19 = mul i64 %18, %17
  %20 = sub i64 %16, %19
  %21 = mul i64 %18, %4
  %22 = icmp ult i64 %21, %3
  br i1 %22, label %23, label %150

23:                                               ; preds = %5
  %24 = add nuw i64 %21, 1
  %25 = add i64 %21, %4
  %26 = trunc i64 %25 to i32
  %27 = add i32 %26, -1
  %28 = trunc i64 %3 to i32
  %29 = add i32 %28, -1
  %30 = tail call i32 @llvm.umin.i32(i32 %27, i32 %29)
  %31 = zext i32 %30 to i64
  %32 = mul i64 %21, %2
  %33 = add i64 %32, %20
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = icmp ult i64 %24, %3
  br i1 %37, label %38, label %44

38:                                               ; preds = %23
  %39 = add i64 %33, %2
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = fmul contract float %41, 2.500000e-01
  %43 = fsub contract float %35, %42
  store float %43, float addrspace(1)* %36, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %38, %23
  %45 = phi float [ %43, %38 ], [ %35, %23 ]
  %46 = icmp eq i64 %21, 0
  br i1 %46, label %53, label %47

47:                                               ; preds = %44
  %48 = sub i64 %33, %2
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fmul contract float %50, 2.500000e-01
  %52 = fsub contract float %45, %51
  store float %52, float addrspace(1)* %36, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %47, %44
  %54 = phi float [ %52, %47 ], [ %45, %44 ]
  %55 = add nuw nsw i64 %20, 1
  %56 = icmp ult i64 %55, %2
  br i1 %56, label %57, label %63

57:                                               ; preds = %53
  %58 = add i64 %33, 1
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fmul contract float %60, 2.500000e-01
  %62 = fsub contract float %54, %61
  store float %62, float addrspace(1)* %36, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %57, %53
  %64 = phi float [ %62, %57 ], [ %54, %53 ]
  %65 = icmp eq i64 %20, 0
  br i1 %65, label %72, label %66

66:                                               ; preds = %63
  %67 = add i64 %33, -1
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fmul contract float %69, 2.500000e-01
  %71 = fsub contract float %64, %70
  store float %71, float addrspace(1)* %36, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %66, %63
  %73 = shl i64 %24, 32
  %74 = ashr exact i64 %73, 32
  %75 = icmp ult i64 %74, %31
  br i1 %75, label %76, label %78

76:                                               ; preds = %72
  %77 = trunc i64 %24 to i32
  br label %80

78:                                               ; preds = %111, %72
  %79 = icmp ult i64 %21, %31
  br i1 %79, label %115, label %150

80:                                               ; preds = %76, %111
  %81 = phi i64 [ %113, %111 ], [ %74, %76 ]
  %82 = phi i32 [ %112, %111 ], [ %77, %76 ]
  %83 = mul i64 %81, %2
  %84 = add i64 %83, %20
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = add i64 %84, %2
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = sub i64 %84, %2
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fadd contract float %89, %92
  %94 = fmul contract float %93, 2.500000e-01
  %95 = fsub contract float %86, %94
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  store float %95, float addrspace(1)* %96, align 4, !tbaa !7
  br i1 %56, label %97, label %103

97:                                               ; preds = %80
  %98 = add i64 %84, 1
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fmul contract float %100, 2.500000e-01
  %102 = fsub contract float %95, %101
  store float %102, float addrspace(1)* %96, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %97, %80
  %104 = phi float [ %102, %97 ], [ %95, %80 ]
  br i1 %65, label %111, label %105

105:                                              ; preds = %103
  %106 = add i64 %84, -1
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fmul contract float %108, 2.500000e-01
  %110 = fsub contract float %104, %109
  store float %110, float addrspace(1)* %96, align 4, !tbaa !7
  br label %111

111:                                              ; preds = %105, %103
  %112 = add nsw i32 %82, 1
  %113 = sext i32 %112 to i64
  %114 = icmp ult i64 %113, %31
  br i1 %114, label %80, label %78, !llvm.loop !11

115:                                              ; preds = %78
  %116 = mul i64 %31, %2
  %117 = add i64 %116, %20
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = sub i64 %117, %2
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %122, 2.500000e-01
  %124 = fsub contract float %119, %123
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  store float %124, float addrspace(1)* %125, align 4, !tbaa !7
  %126 = add nuw nsw i64 %31, 1
  %127 = icmp ult i64 %126, %3
  br i1 %127, label %128, label %134

128:                                              ; preds = %115
  %129 = add i64 %117, %2
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %131, 2.500000e-01
  %133 = fsub contract float %124, %132
  store float %133, float addrspace(1)* %125, align 4, !tbaa !7
  br label %134

134:                                              ; preds = %128, %115
  %135 = phi float [ %133, %128 ], [ %124, %115 ]
  br i1 %56, label %136, label %142

136:                                              ; preds = %134
  %137 = add i64 %117, 1
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fmul contract float %139, 2.500000e-01
  %141 = fsub contract float %135, %140
  store float %141, float addrspace(1)* %125, align 4, !tbaa !7
  br label %142

142:                                              ; preds = %136, %134
  %143 = phi float [ %141, %136 ], [ %135, %134 ]
  br i1 %65, label %150, label %144

144:                                              ; preds = %142
  %145 = add i64 %117, -1
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = fmul contract float %147, 2.500000e-01
  %149 = fsub contract float %143, %148
  store float %149, float addrspace(1)* %125, align 4, !tbaa !7
  br label %150

150:                                              ; preds = %78, %144, %142, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.mustprogress"}
