; ModuleID = '../data/hip_kernels/2792/8/main.cu'
source_filename = "../data/hip_kernels/2792/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@my_smem = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6matmulPKfS0_Pfffiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, float %3, float %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = mul nsw i32 %8, %6
  %11 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = mul nsw i32 %7, %6
  %14 = icmp slt i32 %12, %13
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %14, label %16, label %21

16:                                               ; preds = %9
  %17 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  br label %39

21:                                               ; preds = %39, %9
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = mul i32 %22, %8
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !7
  %28 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %27, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %27, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, -1
  %37 = add i32 %36, %35
  %38 = icmp eq i32 %22, %37
  br i1 %38, label %47, label %51

39:                                               ; preds = %16, %39
  %40 = phi i32 [ %12, %16 ], [ %45, %39 ]
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !6
  %44 = getelementptr inbounds float, float addrspace(3)* %11, i32 %40
  store float %43, float addrspace(3)* %44, align 4, !tbaa !16
  %45 = add i32 %40, %20
  %46 = icmp slt i32 %45, %13
  br i1 %46, label %39, label %21, !llvm.loop !20

47:                                               ; preds = %21
  %48 = srem i32 %5, %8
  %49 = icmp eq i32 %48, 0
  %50 = select i1 %49, i32 %8, i32 %48
  br label %51

51:                                               ; preds = %47, %21
  %52 = phi i32 [ %8, %21 ], [ %50, %47 ]
  %53 = sext i32 %52 to i64
  %54 = zext i32 %12 to i64
  %55 = sext i32 %6 to i64
  %56 = mul nsw i64 %53, %55
  %57 = icmp ugt i64 %56, %54
  br i1 %57, label %58, label %61

58:                                               ; preds = %51
  %59 = mul nsw i64 %24, %55
  %60 = zext i16 %30 to i64
  br label %71

61:                                               ; preds = %71, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = freeze i32 %12
  %63 = freeze i32 %7
  %64 = udiv i32 %62, %63
  %65 = mul i32 %64, %63
  %66 = sub i32 %62, %65
  %67 = zext i32 %64 to i64
  %68 = add nuw nsw i64 %67, %24
  %69 = sext i32 %5 to i64
  %70 = icmp ult i64 %68, %69
  br i1 %70, label %81, label %212

71:                                               ; preds = %58, %71
  %72 = phi i64 [ %54, %58 ], [ %79, %71 ]
  %73 = add i64 %72, %59
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !6
  %76 = fmul contract float %75, %3
  %77 = trunc i64 %72 to i32
  %78 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %77
  store float %76, float addrspace(3)* %78, align 4, !tbaa !16
  %79 = add i64 %72, %60
  %80 = icmp ult i64 %79, %56
  br i1 %80, label %71, label %61, !llvm.loop !22

81:                                               ; preds = %61
  %82 = sext i32 %7 to i64
  %83 = mul nsw i64 %53, %82
  %84 = icmp ugt i64 %83, %54
  br i1 %84, label %85, label %212

85:                                               ; preds = %81
  %86 = icmp eq i32 %6, 0
  br i1 %86, label %117, label %87

87:                                               ; preds = %85
  %88 = mul nsw i32 %66, %6
  %89 = mul nsw i32 %64, %6
  %90 = tail call i64 @llvm.umax.i64(i64 %55, i64 1)
  %91 = add i64 %90, -1
  %92 = and i64 %90, 7
  %93 = icmp ult i64 %91, 7
  br i1 %93, label %96, label %94

94:                                               ; preds = %87
  %95 = and i64 %90, -8
  br label %126

96:                                               ; preds = %126, %87
  %97 = phi float [ undef, %87 ], [ %208, %126 ]
  %98 = phi i64 [ 0, %87 ], [ %209, %126 ]
  %99 = phi float [ 0.000000e+00, %87 ], [ %208, %126 ]
  %100 = icmp eq i64 %92, 0
  br i1 %100, label %117, label %101

101:                                              ; preds = %96, %101
  %102 = phi i64 [ %114, %101 ], [ %98, %96 ]
  %103 = phi float [ %113, %101 ], [ %99, %96 ]
  %104 = phi i64 [ %115, %101 ], [ 0, %96 ]
  %105 = trunc i64 %102 to i32
  %106 = add i32 %88, %105
  %107 = getelementptr inbounds float, float addrspace(3)* %11, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !16
  %109 = add i32 %89, %105
  %110 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !16
  %112 = fmul contract float %108, %111
  %113 = fadd contract float %103, %112
  %114 = add nuw i64 %102, 1
  %115 = add i64 %104, 1
  %116 = icmp eq i64 %115, %92
  br i1 %116, label %117, label %101, !llvm.loop !23

117:                                              ; preds = %96, %101, %85
  %118 = phi float [ 0.000000e+00, %85 ], [ %97, %96 ], [ %113, %101 ]
  %119 = mul nsw i32 %66, %5
  %120 = sext i32 %119 to i64
  %121 = add nsw i64 %68, %120
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !6
  %124 = fmul contract float %123, %4
  %125 = fadd contract float %118, %124
  store float %125, float addrspace(1)* %122, align 4, !tbaa !16
  br label %212

126:                                              ; preds = %126, %94
  %127 = phi i64 [ 0, %94 ], [ %209, %126 ]
  %128 = phi float [ 0.000000e+00, %94 ], [ %208, %126 ]
  %129 = phi i64 [ 0, %94 ], [ %210, %126 ]
  %130 = trunc i64 %127 to i32
  %131 = add i32 %88, %130
  %132 = getelementptr inbounds float, float addrspace(3)* %11, i32 %131
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !16
  %134 = add i32 %89, %130
  %135 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %134
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !16
  %137 = fmul contract float %133, %136
  %138 = fadd contract float %128, %137
  %139 = trunc i64 %127 to i32
  %140 = or i32 %139, 1
  %141 = add i32 %88, %140
  %142 = getelementptr inbounds float, float addrspace(3)* %11, i32 %141
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !16
  %144 = add i32 %89, %140
  %145 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %144
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !16
  %147 = fmul contract float %143, %146
  %148 = fadd contract float %138, %147
  %149 = trunc i64 %127 to i32
  %150 = or i32 %149, 2
  %151 = add i32 %88, %150
  %152 = getelementptr inbounds float, float addrspace(3)* %11, i32 %151
  %153 = load float, float addrspace(3)* %152, align 4, !tbaa !16
  %154 = add i32 %89, %150
  %155 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %154
  %156 = load float, float addrspace(3)* %155, align 4, !tbaa !16
  %157 = fmul contract float %153, %156
  %158 = fadd contract float %148, %157
  %159 = trunc i64 %127 to i32
  %160 = or i32 %159, 3
  %161 = add i32 %88, %160
  %162 = getelementptr inbounds float, float addrspace(3)* %11, i32 %161
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !16
  %164 = add i32 %89, %160
  %165 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %164
  %166 = load float, float addrspace(3)* %165, align 4, !tbaa !16
  %167 = fmul contract float %163, %166
  %168 = fadd contract float %158, %167
  %169 = trunc i64 %127 to i32
  %170 = or i32 %169, 4
  %171 = add i32 %88, %170
  %172 = getelementptr inbounds float, float addrspace(3)* %11, i32 %171
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !16
  %174 = add i32 %89, %170
  %175 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %174
  %176 = load float, float addrspace(3)* %175, align 4, !tbaa !16
  %177 = fmul contract float %173, %176
  %178 = fadd contract float %168, %177
  %179 = trunc i64 %127 to i32
  %180 = or i32 %179, 5
  %181 = add i32 %88, %180
  %182 = getelementptr inbounds float, float addrspace(3)* %11, i32 %181
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !16
  %184 = add i32 %89, %180
  %185 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %184
  %186 = load float, float addrspace(3)* %185, align 4, !tbaa !16
  %187 = fmul contract float %183, %186
  %188 = fadd contract float %178, %187
  %189 = trunc i64 %127 to i32
  %190 = or i32 %189, 6
  %191 = add i32 %88, %190
  %192 = getelementptr inbounds float, float addrspace(3)* %11, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !16
  %194 = add i32 %89, %190
  %195 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %194
  %196 = load float, float addrspace(3)* %195, align 4, !tbaa !16
  %197 = fmul contract float %193, %196
  %198 = fadd contract float %188, %197
  %199 = trunc i64 %127 to i32
  %200 = or i32 %199, 7
  %201 = add i32 %88, %200
  %202 = getelementptr inbounds float, float addrspace(3)* %11, i32 %201
  %203 = load float, float addrspace(3)* %202, align 4, !tbaa !16
  %204 = add i32 %89, %200
  %205 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @my_smem to float addrspace(3)*), i32 %204
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !16
  %207 = fmul contract float %203, %206
  %208 = fadd contract float %198, %207
  %209 = add nuw i64 %127, 8
  %210 = add i64 %129, 8
  %211 = icmp eq i64 %210, %95
  br i1 %211, label %96, label %126, !llvm.loop !25

212:                                              ; preds = %61, %81, %117
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !21}
