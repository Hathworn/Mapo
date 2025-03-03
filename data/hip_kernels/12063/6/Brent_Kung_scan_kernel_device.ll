; ModuleID = '../data/hip_kernels/12063/6/main.cu'
source_filename = "../data/hip_kernels/12063/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22Brent_Kung_scan_kernelPfS_iE2XY = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22Brent_Kung_scan_kernelPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 1
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %20

15:                                               ; preds = %3
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %12
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %15, %3
  %21 = add i32 %13, %10
  %22 = icmp ult i32 %21, %2
  br i1 %22, label %23, label %29

23:                                               ; preds = %20
  %24 = zext i32 %21 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = add nuw nsw i32 %12, %10
  %28 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %27
  store float %26, float addrspace(3)* %28, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %23, %20
  %30 = shl nuw nsw i32 %12, 1
  %31 = add nuw nsw i32 %30, 2
  br label %35

32:                                               ; preds = %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = shl nuw nsw i32 %31, 9
  %34 = icmp eq i32 %12, 0
  br i1 %34, label %50, label %58

35:                                               ; preds = %29, %47
  %36 = phi i32 [ 1, %29 ], [ %48, %47 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = mul i32 %36, %31
  %38 = add i32 %37, -1
  %39 = icmp slt i32 %38, 2048
  br i1 %39, label %40, label %47

40:                                               ; preds = %35
  %41 = sub i32 %38, %36
  %42 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %41
  %43 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %44 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %38
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %46 = fadd contract float %43, %45
  store float %46, float addrspace(3)* %44, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %40, %35
  %48 = shl i32 %36, 1
  %49 = icmp ugt i32 %48, %10
  br i1 %49, label %32, label %35, !llvm.loop !11

50:                                               ; preds = %32
  %51 = add nuw nsw i32 %33, 511
  %52 = add nsw i32 %33, -1
  %53 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %51
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %57 = fadd contract float %54, %56
  store float %57, float addrspace(3)* %55, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %50, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = shl nuw nsw i32 %31, 8
  %60 = icmp ult i32 %12, 3
  br i1 %60, label %61, label %69

61:                                               ; preds = %58
  %62 = add nuw nsw i32 %59, 255
  %63 = add nsw i32 %59, -1
  %64 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %63
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %66 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %62
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %68 = fadd contract float %65, %67
  store float %68, float addrspace(3)* %66, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %61, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = shl nuw nsw i32 %31, 7
  %71 = icmp ult i32 %12, 7
  br i1 %71, label %72, label %80

72:                                               ; preds = %69
  %73 = add nuw nsw i32 %70, 127
  %74 = add nsw i32 %70, -1
  %75 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %73
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %79 = fadd contract float %76, %78
  store float %79, float addrspace(3)* %77, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %72, %69
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = shl nuw nsw i32 %31, 6
  %82 = icmp ult i32 %12, 15
  br i1 %82, label %83, label %91

83:                                               ; preds = %80
  %84 = add nuw nsw i32 %81, 63
  %85 = add nsw i32 %81, -1
  %86 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %88 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %84
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %90 = fadd contract float %87, %89
  store float %90, float addrspace(3)* %88, align 4, !tbaa !7
  br label %91

91:                                               ; preds = %83, %80
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = shl nuw nsw i32 %31, 5
  %93 = icmp ult i32 %12, 31
  br i1 %93, label %94, label %102

94:                                               ; preds = %91
  %95 = add nuw nsw i32 %92, 31
  %96 = add nsw i32 %92, -1
  %97 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %96
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %95
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %101 = fadd contract float %98, %100
  store float %101, float addrspace(3)* %99, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %94, %91
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = shl nuw nsw i32 %31, 4
  %104 = icmp ult i32 %12, 63
  br i1 %104, label %105, label %113

105:                                              ; preds = %102
  %106 = add nuw nsw i32 %103, 15
  %107 = add nsw i32 %103, -1
  %108 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %106
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = fadd contract float %109, %111
  store float %112, float addrspace(3)* %110, align 4, !tbaa !7
  br label %113

113:                                              ; preds = %105, %102
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = shl nuw nsw i32 %31, 3
  %115 = icmp ult i32 %12, 127
  br i1 %115, label %116, label %124

116:                                              ; preds = %113
  %117 = add nuw nsw i32 %114, 7
  %118 = add nsw i32 %114, -1
  %119 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %121 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %117
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %123 = fadd contract float %120, %122
  store float %123, float addrspace(3)* %121, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %116, %113
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %125 = shl nuw nsw i32 %31, 2
  %126 = icmp ult i32 %12, 255
  br i1 %126, label %127, label %135

127:                                              ; preds = %124
  %128 = add nuw nsw i32 %125, 3
  %129 = add nsw i32 %125, -1
  %130 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !7
  %132 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %128
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !7
  %134 = fadd contract float %131, %133
  store float %134, float addrspace(3)* %132, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %127, %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %136 = shl nuw nsw i32 %31, 1
  %137 = icmp ult i32 %12, 511
  br i1 %137, label %138, label %146

138:                                              ; preds = %135
  %139 = add nuw nsw i32 %136, 1
  %140 = add nsw i32 %136, -1
  %141 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %140
  %142 = load float, float addrspace(3)* %141, align 4, !tbaa !7
  %143 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %139
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = fadd contract float %142, %144
  store float %145, float addrspace(3)* %143, align 4, !tbaa !7
  br label %146

146:                                              ; preds = %138, %135
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = icmp eq i32 %12, 1023
  br i1 %147, label %155, label %148

148:                                              ; preds = %146
  %149 = add nuw nsw i32 %30, 1
  %150 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %149
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !7
  %152 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %31
  %153 = load float, float addrspace(3)* %152, align 8, !tbaa !7
  %154 = fadd contract float %151, %153
  store float %154, float addrspace(3)* %152, align 8, !tbaa !7
  br label %155

155:                                              ; preds = %148, %146
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %156, label %161

156:                                              ; preds = %155
  %157 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %12
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !7
  %159 = sext i32 %13 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  store float %158, float addrspace(1)* %160, align 4, !tbaa !7
  br label %161

161:                                              ; preds = %156, %155
  br i1 %22, label %162, label %168

162:                                              ; preds = %161
  %163 = add nuw nsw i32 %12, %10
  %164 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ22Brent_Kung_scan_kernelPfS_iE2XY, i32 0, i32 %163
  %165 = load float, float addrspace(3)* %164, align 4, !tbaa !7
  %166 = zext i32 %21 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  store float %165, float addrspace(1)* %167, align 4, !tbaa !7
  br label %168

168:                                              ; preds = %162, %161
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
